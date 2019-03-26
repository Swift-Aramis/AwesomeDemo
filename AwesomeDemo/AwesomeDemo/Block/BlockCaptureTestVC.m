//
//  BlockCaptureTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/25.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "BlockCaptureTestVC.h"
#import "MCBlock.h"

@interface BlockCaptureTestVC ()

@end

@implementation BlockCaptureTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    MCBlock *block = [[MCBlock alloc] init];
    [block captureMethod];
}

@end
