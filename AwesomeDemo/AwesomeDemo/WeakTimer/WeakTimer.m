//
//  WeakTimer.m
//  MainQueue
//
//  Created by 提运佳 on 2019/3/5.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "WeakTimer.h"

//⚠️ 忽略leak警告 宏
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

//定义中间对象
@interface TimerWeakObject : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;

- (void)fire:(NSTimer *)timer;

@end

@implementation TimerWeakObject

- (void)fire:(NSTimer *)timer {
    if (self.target) {
        if ([self.target respondsToSelector:self.selector]) {
            //此处有警告⚠️ : PerformSelector may cause a leak because its selector is unknown
//            [self.target performSelector:self.selector withObject:timer.userInfo];
            
            //解决方式1：忽略警告
            //a.直接忽略
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.target performSelector:self.selector withObject:timer.userInfo];
#pragma clang diagnostic pop
            
            //b.宏方式
//            SuppressPerformSelectorLeakWarning([self.target performSelector:self.selector withObject:timer.userInfo]);
            
            //c.需要返回值方式
//            id result;
//            SuppressPerformSelectorLeakWarning(
//            result = [self.target performSelector:self.selector withObject:timer.userInfo]
//                                               );
            
            //解决方式2：消除警告
//            IMP imp = [self.target methodForSelector:self.selector];
//            void (*func)(id, SEL) = (void *)imp;
//            func(self.target, self.selector);
            
            /**
             原理：向target请求那个方法对应的C指针。所有的 NSObject 对象都能响应 methodForSelector: 这个方法，这种函数指针叫做IMP，就是typedef过的函数指针
             id (*IMP)(id, SEL, ...)。得到IMP之后，需要进行转换，转换后的函数指针包含ARC所需的那些细节，比如每个OC方法调用都有的两个隐藏参数self和_cmd。
             */
            
            //如果 selector 接收参数，或者有返回值，代码就需要改改：
            /**
             SEL selector = NSSelectorFromString(@"processRegion:ofView:");
             IMP imp = [target methodForSelector:selector];
             CGRect (*func)(id, SEL, CGRect, UIView *) = (void *)imp;
             CGRect result = target ? func(target, selector, someRect, someView) : CGRectZero;
             */
        }
    }
    else {
        [self.timer invalidate];
    }
}

@end


@implementation WeakTimer

+ (NSTimer *)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)ti
                                         target:(id)aTarget
                                       selector:(SEL)aSelector
                                       userInfo:(id)userInfo
                                        repeats:(BOOL)yesOrNo {
    
    TimerWeakObject *obj = [[TimerWeakObject alloc] init];
    obj.target = aTarget;
    obj.selector = aSelector;
    obj.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:obj selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
    
    return obj.timer;
}

@end
