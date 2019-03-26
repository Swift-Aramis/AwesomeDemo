//
//  RootTableController.m
//  AwesomeDemo
//
//  Created by 提运佳 on 2019/3/25.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "RootTableController.h"
#import "EventTestVC.h"
#import "IndextedTableTestVC.h"
#import "ObserverTestVC.h"
#import "WeakTimerTestVC.h"
#import "BlockCaptureTestVC.h"
#import "BarrierTestVC.h"
#import "GroupTestVC.h"
#import "SemaphoreTestVC.h"
#import "RunloopTestVC.h"
#import "CopyStringTestVC.h"

@interface RootTableController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation RootTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:self.navigationItem.backBarButtonItem.style target:nil action:nil];
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        NSString *listPath = [[NSBundle mainBundle] pathForResource:@"RootList" ofType:@"plist"];
        _dataSource = [[NSArray alloc] initWithContentsOfFile:listPath];
    }
    return _dataSource;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    NSDictionary *itemDic = self.dataSource[indexPath.row];
    cell.textLabel.text = itemDic[@"itemName"];
    cell.detailTextLabel.text = itemDic[@"itemDes"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self didSelectRowWithDic:self.dataSource[indexPath.row]];
}

- (void)didSelectRowWithDic:(NSDictionary *)itemDic {
    NSString *itemName = itemDic[@"itemName"];
    NSString *itemDes = itemDic[@"itemDes"];
    
    if ([itemName isEqualToString:@"Event"]) {
        EventTestVC *eventTestVC = [[EventTestVC alloc] init];
        eventTestVC.title = itemDes;
        [self.navigationController pushViewController:eventTestVC animated:YES];
    }
    else if ([itemName isEqualToString:@"cell reuse"]) {
        IndextedTableTestVC *indextedTableTestVC = [[IndextedTableTestVC alloc] init];
        indextedTableTestVC.title = itemDes;
        [self.navigationController pushViewController:indextedTableTestVC animated:YES];
    }
    else if ([itemName isEqualToString:@"Observer"]) {
        ObserverTestVC *observerTestVC = [[ObserverTestVC alloc] init];
        observerTestVC.title = itemDes;
        [self.navigationController pushViewController:observerTestVC animated:YES];
    }
    else if ([itemName isEqualToString:@"WeakTimer"]) {
        WeakTimerTestVC *weakTimerTestVC = [[WeakTimerTestVC alloc] init];
        weakTimerTestVC.title = itemDes;
        [self.navigationController pushViewController:weakTimerTestVC animated:YES];
    }
    else if ([itemName isEqualToString:@"Block"]) {
        BlockCaptureTestVC *blockCaptureTestVC = [[BlockCaptureTestVC alloc] init];
        blockCaptureTestVC.title = itemDes;
        [self.navigationController pushViewController:blockCaptureTestVC animated:YES];
    }
    else if ([itemName isEqualToString:@"dispatch_barrier"]) {
        BarrierTestVC *barrierTestVC = [[BarrierTestVC alloc] init];
        barrierTestVC.title = itemDes;
        [self.navigationController pushViewController:barrierTestVC animated:YES];
    }
    else if ([itemName isEqualToString:@"dispatch_group"]) {
        GroupTestVC *groupTestVC = [[GroupTestVC alloc] init];
        groupTestVC.title = itemDes;
        [self.navigationController pushViewController:groupTestVC animated:YES];
    }
    else if ([itemName isEqualToString:@"dispatch_semaphore"]) {
        SemaphoreTestVC *semaphoreTestVC = [[SemaphoreTestVC alloc] init];
        semaphoreTestVC.title = itemDes;
        [self.navigationController pushViewController:semaphoreTestVC animated:YES];
    }
    else if ([itemName isEqualToString:@"Runloop"]) {
        RunloopTestVC *runloopTestVC = [[RunloopTestVC alloc] init];
        runloopTestVC.title = itemDes;
        [self.navigationController pushViewController:runloopTestVC animated:YES];
    }
    else if ([itemName isEqualToString:@"copy String"]) {
        CopyStringTestVC *copyStringTestVC = [[CopyStringTestVC alloc] init];
        copyStringTestVC.title = itemDes;
        [self.navigationController pushViewController:copyStringTestVC animated:YES];
    }
}

@end
