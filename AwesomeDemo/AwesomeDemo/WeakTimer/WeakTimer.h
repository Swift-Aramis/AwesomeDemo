//
//  WeakTimer.h
//  MainQueue
//
//  Created by 提运佳 on 2019/3/5.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakTimer : NSTimer

+ (NSTimer *)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)ti
                                         target:(id)aTarget
                                       selector:(SEL)aSelector
                                       userInfo:(id)userInfo
                                        repeats:(BOOL)yesOrNo;

@end
