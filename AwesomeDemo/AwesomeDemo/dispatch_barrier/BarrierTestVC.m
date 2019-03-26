//
//  BarrierTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/25.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "BarrierTestVC.h"
#import "UserCenter.h"

@interface BarrierTestVC ()

@end

@implementation BarrierTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //多读单写，多个异步线程去读和写
    
    UserCenter *user = [[UserCenter alloc] init];
    
    [user setObject:@"UserObject0" forKey:@"User"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@",[user objectForKey:@"User"]);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@",[user objectForKey:@"User"]);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [user setObject:@"UserObject1" forKey:@"User"];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@",[user objectForKey:@"User"]);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@",[user objectForKey:@"User"]);
    });
    
}

@end
