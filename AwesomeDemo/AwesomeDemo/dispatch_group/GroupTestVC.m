//
//  GroupTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/26.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "GroupTestVC.h"
#import "GroupObject.h"

@interface GroupTestVC ()

@end

@implementation GroupTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    GroupObject *group = [[GroupObject alloc] init];
    [group handle];
}

@end
