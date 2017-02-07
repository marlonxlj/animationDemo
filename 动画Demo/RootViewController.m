//
//  RootViewController.m
//  动画Demo
//
//  Created by m on 2017/2/6.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "RootViewController.h"

@interface AnimationObjects : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *className;

@end

@implementation AnimationObjects

@end

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *dataSource;;
@end

@implementation RootViewController
{
    UITableView *_tableView;
}
- (NSArray *)dataSource
{
    if (!_dataSource) {
        [self addDataSource];
    }
    return _dataSource;
}

- (void)addDataSource
{
    AnimationObjects *impvc = [AnimationObjects new];
    impvc.title = @"隐式动画";
    impvc.className = @"ImplicitAnimationVC";
    
    AnimationObjects *presentation = [AnimationObjects new];
    presentation.title = @"Layer树";
    presentation.className = @"PresentationTreeViewController";
    
    AnimationObjects *transaction = [AnimationObjects new];
    transaction.title = @"Transacton事物";
    transaction.className = @"TransactionViewController";
    AnimationObjects *baseAnimation = [AnimationObjects new];
    baseAnimation.title = @"BasicAnimation";
    baseAnimation.className = @"BaseAnimationController";
    
    AnimationObjects *additAnimation = [AnimationObjects new];
    additAnimation.title = @"additAnimation";
    additAnimation.className = @"additiveAnimationController";
    
    AnimationObjects *mediaAnimation = [AnimationObjects new];
    mediaAnimation.title = @"MediaAnimation";
    mediaAnimation.className = @"MediaTimingViewController";
    
    
    AnimationObjects *fileModelAnimation = [AnimationObjects new];
    fileModelAnimation.title = @"Fill model Animation";
    fileModelAnimation.className = @"fillModelController";
    
    
    _dataSource = @[impvc,presentation,transaction,baseAnimation, additAnimation,mediaAnimation,fileModelAnimation];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatSubViews];
}

- (void)creatSubViews
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [self.dataSource[indexPath.row] title];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *className = [self.dataSource[indexPath.row] className];
    UIViewController *VC = [NSClassFromString(className) new];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
