//
//  SemaphoreTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/26.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "SemaphoreTestVC.h"

@interface SemaphoreTestVC ()

@end

@implementation SemaphoreTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    //保持线程同步
    [self syncGCD];
    
    //为线程加锁
//    [self lockGCD];
    
    //设置GCD最大线程数
//    [self maxCountGCD];
}

//warning - 注意 signal +1 和 wait -1 的书写顺序

- (void)syncGCD {
    dispatch_queue_t concurrent_queue = dispatch_queue_create("syncGCD", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    dispatch_async(concurrent_queue, ^{
        sleep(3);
        NSLog(@"xxx");
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC);
    if (dispatch_semaphore_wait(semaphore, timeout)) {
        NSLog(@"执行超时");
    } else {
        NSLog(@"执行未超时");
    }
}

- (void)lockGCD {
    dispatch_queue_t concurrent_queue = dispatch_queue_create("lockGCD", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    for (int i = 0; i < 10; i++) {
        
        dispatch_async(concurrent_queue, ^{
            // 相当于加锁
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            
            sleep(2);
            NSLog(@"i = %d currentThread = %@", i, [NSThread currentThread]);
            
            // 相当于解锁
            dispatch_semaphore_signal(semaphore);
        });
        
    }
}

- (void)maxCountGCD {
    dispatch_queue_t concurrent_queue = dispatch_queue_create("maxCountGCD", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(5);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(concurrent_queue, ^{
            // 相当于加锁
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            
            sleep(2);
            NSLog(@"i = %d currentThread = %@", i, [NSThread currentThread]);
            
            // 相当于解锁
            dispatch_semaphore_signal(semaphore);
        });
    }
    
}

@end
