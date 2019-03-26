//
//  MCBlock.h
//  MainQueue
//
//  Created by 提运佳 on 2019/3/6.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MCBlock : NSObject

- (void)method;
//clang -rewrite-objc XXfile.m

- (void)captureMethod;

//@property (nonatomic, assign) int propertyInt;
//@property (nonatomic, copy) NSString *propertyStr;

@end

NS_ASSUME_NONNULL_END
