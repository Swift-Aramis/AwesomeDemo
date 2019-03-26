//
//  MObject.m
//  MainQueue
//
//  Created by 提运佳 on 2019/3/5.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "MObject.h"

@implementation MObject

- (id)init {
    self = [super init];
    if (self) {
        _value = 0;
    }
    return self;
}

- (void)setValue:(int)value {
    NSLog(@"setValue - %d",value);
}

- (void)increase {
    _value += 1;
}

@end
