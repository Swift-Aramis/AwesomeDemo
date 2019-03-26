//
//  Runloop.m
//  MainQueue
//
//  Created by 提运佳 on 2019/3/13.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "Runloop.h"

static NSThread *thread = nil;
//标记是否要继续事件循环
static BOOL runAlways = YES;

@implementation Runloop

+ (NSThread *)threadForDispatch {
    if (thread == nil) {
        @synchronized (self) {
            if (thread == nil) {
                //线程的创建
                thread = [[NSThread alloc] initWithTarget:self selector:@selector(runRequest) object:nil];
                [thread setName:@"com.imooc.thread"];
                //启动
                [thread start];
            }
        }
    }
    return thread;
}

+ (void)runRequest {
    /**
     === CF方式 ===
     */
    //创建一个Source
    CFRunLoopSourceContext context = {0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
    CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
    
    //创建RunLoop，同时向RunLoop的DefaultMode下添加Source
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    
    //如果可以运行
    while (runAlways) {
        @autoreleasepool {
            //令当前RunLoop运行在DefaultMode下面
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
        }
    }
    
    //某一时机，静态变量runAlways = NO时，可以保证跳出RunLoop，线程退出
    CFRunLoopRemoveSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    CFRelease(source);
    
    
    /**
     === 常用方式 ===
     */
    @autoreleasepool {
        
        //方式1、添加一个input source
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
        
        //方式2、添加一个定时器
//        NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
        
        //利用常驻线程处理事情
//        [self performSelector:@selector(action) onThread:thread withObject:nil waitUntilDone:NO];
    }
}

@end
