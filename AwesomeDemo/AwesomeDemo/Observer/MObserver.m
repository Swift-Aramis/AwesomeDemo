//
//  MObserver.m
//  MainQueue
//
//  Created by 提运佳 on 2019/3/5.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "MObserver.h"
#import "MObject.h"

@implementation MObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([object isKindOfClass:[MObject class]] &&
        [keyPath isEqualToString:@"value"]) {
        //获取value的新值
        NSNumber *valueNum = [change valueForKey:NSKeyValueChangeNewKey];
        NSLog(@"value is %@",valueNum);
    }
    
}

@end
