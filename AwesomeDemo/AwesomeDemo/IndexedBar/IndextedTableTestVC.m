//
//  IndextedTableTestVC.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/25.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "IndextedTableTestVC.h"
#import "IndexedTableView.h"

@interface IndextedTableTestVC ()<UITableViewDelegate, UITableViewDataSource, IndexedTableViewDataSource>

@property (nonatomic, strong) IndexedTableView *tableView;
@property (nonatomic, strong) UIButton *reloadButton;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation IndextedTableTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.reloadButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat originY = statusBarFrame.size.height + 44;
    _reloadButton.frame = CGRectMake(0, originY, self.view.frame.size.width, 40);
    _tableView.frame = CGRectMake(0, CGRectGetMaxY(_reloadButton.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(_reloadButton.frame));
}

- (void)reloadButtonClicked {
    NSLog(@"reloadData");
    [_tableView reloadData];
}

#pragma mark - IndexedTableViewDataSource
- (NSArray<NSString *> *)indexTitlesForIndexedTableView:(UITableView *)tableView {
    //奇数次调用返回6个字母，偶数次调用返回11个字母
    static BOOL change = NO;
    if (change) {
        change = NO;
        return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K"];
    }
    else {
        change = YES;
        return @[@"A",@"B",@"C",@"D",@"E",@"F"];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    NSNumber *num = _dataSource[indexPath.row];
    cell.textLabel.text = num.stringValue;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < 100; i++) {
            [_dataSource addObject:@(i + 1)];
        }
    }
    return _dataSource;
}


- (IndexedTableView *)tableView {
    if (!_tableView) {
        _tableView = [[IndexedTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.indexedDataSource = self;
    }
    return _tableView;
}

- (UIButton *)reloadButton {
    if (!_reloadButton) {
        _reloadButton = [[UIButton alloc] init];
        _reloadButton.backgroundColor = [UIColor redColor];
        _reloadButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_reloadButton setTitle:@"reloadTable" forState:UIControlStateNormal];
        [_reloadButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_reloadButton addTarget:self action:@selector(reloadButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reloadButton;
}


@end
