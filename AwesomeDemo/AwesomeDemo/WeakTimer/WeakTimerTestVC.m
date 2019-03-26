//
//  WeakTimerTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/25.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "WeakTimerTestVC.h"
#import "WeakTimer.h"

@interface WeakTimerTestVC ()

@end

@implementation WeakTimerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [WeakTimer scheduledWeakTimerWithTimeInterval:1 target:self selector:@selector(testWeakTimer) userInfo:nil repeats:YES];
    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testNSTimer) userInfo:nil repeats:YES];
}

- (void)testWeakTimer {
    NSLog(@"WeakTimer --- Test");
}

//- (void)testNSTimer {
//    NSLog(@"NSTimer --- Test");
//}

- (void)dealloc {
    NSLog(@"WeakTimerTestVC - dealloc");
}

@end
