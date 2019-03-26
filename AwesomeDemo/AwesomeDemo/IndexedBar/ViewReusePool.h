//
//  ViewReusePool.h
//  IndexedBar
//
//  Created by 提运佳 on 2019/3/4.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//实现重用机制的类
@interface ViewReusePool : NSObject

//从重用池中取出一个可重用的view
- (UIView *)dequeueReusableView;

//向重用池中添加一个视图
- (void)addUsingView:(UIView *)view;

//重置方法，将当前使用中的视图移动到可重用队列中
- (void)reset;

@end
