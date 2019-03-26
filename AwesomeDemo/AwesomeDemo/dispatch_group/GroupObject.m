//
//  GroupObject.m
//  MainQueue
//
//  Created by 提运佳 on 2019/3/6.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "GroupObject.h"

@interface GroupObject ()
{
    dispatch_queue_t concurrent_queue;
    NSMutableArray <NSURL *> *arrayURLs;
}

@end

@implementation GroupObject

- (id)init {
    self = [super init];
    if (self) {
        //通过宏定义 DISPATCH_QUEUE_CONCURRENT 创建一个并发队列
        concurrent_queue = dispatch_queue_create("group_queue", DISPATCH_QUEUE_CONCURRENT);
        //创建数据容器
        arrayURLs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)handle {
    dispatch_group_t group = dispatch_group_create();
    
    for (NSURL *url in arrayURLs) {
        
        //异步组分派到并发队列中
        dispatch_group_async(group, concurrent_queue, ^{
           //根据url下载图片任务
            NSLog(@"url is %@",url);
        });
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //当添加到组中的所有任务执行完成之后会调用该block
        NSLog(@"所有图片全部下载完成");
    });
}


@end
