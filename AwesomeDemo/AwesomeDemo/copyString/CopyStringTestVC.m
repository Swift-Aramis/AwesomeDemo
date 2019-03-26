//
//  CopyStringTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/26.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "CopyStringTestVC.h"

@interface CopyStringTestVC ()

@property (nonatomic, copy) NSString *stringCopy;
@property (nonatomic, strong) NSString *stringStrong;

@end

@implementation CopyStringTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self copyStringTest];

    [self strongStringTest];
}

- (void)copyStringTest {
    
    /**
     注意点：
     1.赋值的时候需要调用self.stringCopy,调用set方法,set方法里进行了copy操作
     2.string的初始值来自mString，赋值时在set方法里进行了copy（深拷贝），
     所以之后如果mString的值有改变，string的值能保证独立，不发生改变。
     3.总结：copy属性用来修饰不可变OC数据类型
     */
    
    //初始string
    NSMutableString *mString = @"123".mutableCopy;
    self.stringCopy = mString;//赋值的时候需要调用self.stringCopy,调用set方法,set方法里进行了copy操作
    NSLog(@"mString === %@, address === %p", mString, mString);
    NSLog(@"stringCopy === %@, address === %p", _stringCopy, _stringCopy);
    
    //修改mString
    NSLog(@"修改初始可变字符串后");
    [mString appendString:@"456"];
    NSLog(@"mString === %@, address === %p", mString, mString);
    NSLog(@"stringCopy === %@, address === %p", _stringCopy, _stringCopy);
    
    /**
     mString === 123, address === 0x6000027c8450
     stringCopy === 123, address === 0xaaea41fe68108cf6
     
     修改初始可变字符串后
     
     mString === 123456, address === 0x6000027c8450
     stringCopy === 123, address === 0xaaea41fe68108cf6
     */
}

- (void)strongStringTest {
    
    //初始string
    NSMutableString *mString = @"123".mutableCopy;
    self.stringStrong = mString;//赋值的时候需要调用self.stringCopy,调用set方法,set方法里进行了copy操作
    NSLog(@"mString === %@, address === %p", mString, mString);
    NSLog(@"stringStrong === %@, address === %p", _stringStrong, _stringStrong);
    
    //修改mString
    NSLog(@"修改初始可变字符串后");
    [mString appendString:@"456"];
    NSLog(@"mString === %@, address === %p", mString, mString);
    NSLog(@"stringStrong === %@, address === %p", _stringStrong, _stringStrong);
    
    /**
     mString === 123, address === 0x600003140a20
     stringStrong === 123, address === 0x600003140a20
     修改初始可变字符串后
     mString === 123456, address === 0x600003140a20
     stringStrong === 123456, address === 0x600003140a20
     */
}


@end
