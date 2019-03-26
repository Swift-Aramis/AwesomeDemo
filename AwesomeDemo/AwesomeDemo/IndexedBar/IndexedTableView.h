//
//  IndexedTableView.h
//  IndexedBar
//
//  Created by 提运佳 on 2019/3/4.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IndexedTableViewDataSource <NSObject>

//获取一个tableView的字母索引条数据的方法
- (NSArray <NSString *> *)indexTitlesForIndexedTableView:(UITableView *)tableView;

@end

@interface IndexedTableView : UITableView

@property (nonatomic, weak) id <IndexedTableViewDataSource> indexedDataSource;

@end

