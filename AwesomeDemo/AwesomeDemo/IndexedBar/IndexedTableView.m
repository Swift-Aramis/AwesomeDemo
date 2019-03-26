//
//  IndexedTableView.m
//  IndexedBar
//
//  Created by 提运佳 on 2019/3/4.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "IndexedTableView.h"
#import "ViewReusePool.h"

@interface IndexedTableView ()
{
    UIView *containerView;
    ViewReusePool *reusePool;
}


@end

@implementation IndexedTableView

- (void)reloadData {
    [super reloadData];
    
    //懒加载
    if (containerView == nil) {
        containerView = [[UIView alloc] initWithFrame:CGRectZero];
        containerView.backgroundColor = [UIColor whiteColor];
        //避免索引条随着table滚动
        [self.superview insertSubview:containerView aboveSubview:self];
    }
    
    if (reusePool == nil) {
        reusePool = [[ViewReusePool alloc] init];
    }
    
    //标记所有视图为可重用状态
    [reusePool reset];
    
    //reload字母索引条
    [self reloadIndexedBar];
}

- (void)reloadIndexedBar {
    //获取字母索引条的显示内容
    NSArray <NSString *> *arrayTitles = nil;
    if ([self.indexedDataSource respondsToSelector:@selector(indexTitlesForIndexedTableView:)]) {
        arrayTitles = [self.indexedDataSource indexTitlesForIndexedTableView:self];
    }
    
    //判断字母索引条是否为空
    if (!arrayTitles || arrayTitles.count <= 0) {
        containerView.hidden = YES;
        return;
    }
    
    NSUInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;
    
    for (NSInteger i = 0; i < arrayTitles.count; i++) {
        NSString *title = arrayTitles[i];
        
        //从重用池中取一个Button出来
        UIButton *button = (UIButton *)[reusePool dequeueReusableView];
        if (button == nil) {
            button = [[UIButton alloc] initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor whiteColor];
            
            //注册button到重用池中
            [reusePool addUsingView:button];
            NSLog(@"新建了一个button");
        }
        else {
            NSLog(@"button 重用了");
        }
        
        //添加到父视图控件
        [containerView addSubview:button];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(0, i * buttonHeight, buttonWidth, buttonHeight);
    }
    
    containerView.hidden = NO;
    containerView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - buttonWidth, self.frame.origin.y, buttonWidth, self.frame.size.height);
}

@end
