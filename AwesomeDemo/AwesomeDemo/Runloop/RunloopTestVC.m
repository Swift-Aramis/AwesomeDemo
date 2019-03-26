
//
//  RunloopTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/26.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "RunloopTestVC.h"
#import "Runloop.h"

@interface RunloopTestVC ()

@end

@implementation RunloopTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [Runloop threadForDispatch];
}

@end
