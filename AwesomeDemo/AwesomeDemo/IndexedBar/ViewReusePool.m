//
//  ViewReusePool.m
//  IndexedBar
//
//  Created by 提运佳 on 2019/3/4.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool ()

//等待使用的队列
@property (nonatomic, strong) NSMutableSet *waitUsingQueue;
//使用中的队列
@property (nonatomic, strong) NSMutableSet *usingQueue;

@end

@implementation ViewReusePool

- (id)init {
    self = [super init];
    if (self) {
        _waitUsingQueue = [NSMutableSet set];
        _usingQueue = [NSMutableSet set];
    }
    return self;
}

- (UIView *)dequeueReusableView {
    UIView *view = [_waitUsingQueue anyObject];
    if (view == nil) {
        return nil;
    }
    else {
        //进行队列移动
        [_waitUsingQueue removeObject:view];
        [_usingQueue addObject:view];
        return view;
    }
}

- (void)addUsingView:(UIView *)view {
    if (view == nil) {
        return;
    }
    //添加视图到使用中的队列
    [_usingQueue addObject:view];
}

- (void)reset {
    UIView *view = nil;
    while ((view = [_usingQueue anyObject])) {
        //从使用中队列移除
        [_usingQueue removeObject:view];
        //加入等待使用的队列
        [_waitUsingQueue addObject:view];
    }
}

@end
