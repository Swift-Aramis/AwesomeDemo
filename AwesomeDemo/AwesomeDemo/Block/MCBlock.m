//
//  MCBlock.m
//  MainQueue
//
//  Created by 提运佳 on 2019/3/6.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "MCBlock.h"

@interface MCBlock ()

@property (nonatomic, assign) int propertyInt;
@property (nonatomic, copy) NSString *propertyStr;

@end

@implementation MCBlock

- (void)method {
    int multiplier = 6;
    int(^Block)(int) = ^int(int num){
        return num * multiplier;
    };
    
    Block(2);
}

//全局变量
int global_var = 4;
//静态全局变量
static int static_global_var = 5;

- (void)captureMethod {
    //基本数据类型的局部变量
    int var = 1;
    //对象类型的局部变量
    __unsafe_unretained id unsafe_obj = nil;
    __strong id strong_obj = nil;
    
    NSString *str = @"str";
    
    //局部静态变量
    static int static_var = 3;
    //属性 -> 相当于全局变量
    _propertyInt = 10;
    _propertyStr = @"old string";
    
    __weak typeof(self) weakSelf = self;
    void(^Block)(void) = ^{
        
        NSLog(@"局部变量<基本数据类型> - %d",var);
        
        NSLog(@"局部变量<__unsafe_unretained 对象类型> - %@",unsafe_obj);
        NSLog(@"局部变量<__strong 对象类型> - %@",strong_obj);
        
        NSLog(@"局部静态变量 - %d",static_var);
        
        NSLog(@"全局变量 - %d",global_var);
        NSLog(@"静态全局变量 - %d",static_global_var);
        
        NSLog(@"属性 - propertyInt - %d",weakSelf.propertyInt);
        NSLog(@"属性 - propertyStr - %@",weakSelf.propertyStr);
        NSLog(@"局部字符串 - str - %@",str);
    };
    
    var = 100;
    
    static_var = 300;
    
    global_var = 400;
    
    static_global_var = 500;
    
    _propertyInt = 20;
    _propertyStr = @"new string";
    str = @"new str";
    
    Block();
    
    /**
     ===> 需要用__block
     局部变量：
     基本数据类型：对于基本数据类型的局部变量，截获其值
     对象类型：连同所有权修饰符一起截获
     
     ===> 不需要用__block
     静态局部变量：指针形式进行截获
     
     全局变量：不截获，在block结构体的外部
     
     静态全局变量：不截获，在block结构体的外部
     */
}

@end
