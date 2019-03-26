//
//  ObserverTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/25.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "ObserverTestVC.h"
#import "MObject.h"
#import "MObserver.h"

@interface ObserverTestVC ()

@end

@implementation ObserverTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    MObject *obj = [[MObject alloc] init];
    MObserver *observer = [[MObserver alloc] init];
    
    //调用KVO方法监听obj的value属性的变化
    [obj addObserver:observer forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:NULL];
    
    //通过setter方法修改value
    NSLog(@"通过setter方法修改value");
    obj.value = 1;
    
    //1、通过KVC设置value能否生效 能，KVC最终也会调用setter方法
    NSLog(@"通过KVC设置value能否生效 能，KVC最终也会调用setter方法");
    [obj setValue:@2 forKey:@"value"];
    
    //2、通过成员变量设置value能否生效 不能，不会调用setter方法，可通过手动触发解决
    NSLog(@"通过成员变量设置value能否生效 不能，不会调用setter方法，可通过手动触发解决");
    [obj increase];
    
}

@end
