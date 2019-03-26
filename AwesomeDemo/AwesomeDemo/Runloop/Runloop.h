//
//  Runloop.h
//  MainQueue
//
//  Created by 提运佳 on 2019/3/13.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Runloop : NSObject

+ (NSThread *)threadForDispatch;

@end

NS_ASSUME_NONNULL_END
