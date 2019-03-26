//
//  EventTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/25.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "EventTestVC.h"
#import "CustomButton.h"

@interface EventTestVC ()

@end

@implementation EventTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CustomButton *button = [[CustomButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, 200, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked {
    NSLog(@"click");
    //只有圆形区域响应事件，四角不响应
}

@end
