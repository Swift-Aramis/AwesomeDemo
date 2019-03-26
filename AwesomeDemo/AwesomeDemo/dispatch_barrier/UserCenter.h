//
//  UserCenter.h
//  MainQueue
//
//  Created by 提运佳 on 2019/3/6.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserCenter : NSObject

- (id)objectForKey:(NSString *)key;
- (void)setObject:(id)obj forKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
