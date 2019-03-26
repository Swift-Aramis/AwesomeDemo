//
//  UserCenter.m
//  MainQueue
//
//  Created by 提运佳 on 2019/3/6.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "UserCenter.h"

@interface UserCenter ()
{
    //定义一个并发队列
    dispatch_queue_t concurrent_queue;
    //用户数据中心，可能多个线程需要数据访问
    NSMutableDictionary *userCenterDic;
}

@end

//多读单写模型
@implementation UserCenter

- (id)init {
    self = [super init];
    if (self) {
        //通过宏定义 DISPATCH_QUEUE_CONCURRENT 创建一个并发队列
        concurrent_queue = dispatch_queue_create("read_write_queue", DISPATCH_QUEUE_CONCURRENT);
        //创建数据容器
        userCenterDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)objectForKey:(NSString *)key {
    __block id obj;
    //同步读取指定数据
    dispatch_sync(concurrent_queue, ^{
        obj = [self->userCenterDic objectForKey:key];
        NSLog(@"同步读取指定数据");
    });
    //concurrent_queue 并发->保证多个线程都可调用
    //sync 同步->立刻返回结果
    return obj;
}

- (void)setObject:(id)obj forKey:(NSString *)key {
    //异步栅栏调用设置数据
    dispatch_barrier_async(concurrent_queue, ^{
        [self->userCenterDic setObject:obj forKey:key];
        NSLog(@"异步栅栏调用设置数据");
    });
}

@end
