//
//  TransactionViewController.m
//  动画Demo
//
//  Created by m on 2017/2/6.
//  Copyright © 2017年 XLJ. All rights reserved.
//
// 事物
#import "TransactionViewController.h"

@interface TransactionViewController ()
{
    CALayer *_myLayer;
}
@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSubViews];
}

- (void)creatSubViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Transaction事物";
    
    _myLayer = [CALayer layer];
    _myLayer.frame = CGRectMake(80, 100, 50, 50);
    _myLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:_myLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testTransaction];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testDisableTransaction];
}
- (void)testTransaction
{
    //需要把代码写在begin与commit之间
    [CATransaction begin];
    //控制动画的时间，默认是1/4秒
    [CATransaction setAnimationDuration:5];
    
    [CATransaction setCompletionBlock:^{
        NSLog(@"动画结束了~~~~");
    }];
    _myLayer.position = CGPointMake(_myLayer.position.x + 100, _myLayer.position.y);
    
    [CATransaction commit];
}

- (void)testDisableTransaction
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _myLayer.position = CGPointMake(_myLayer.position.x + 100, _myLayer.position.y);
    [CATransaction commit];
    
   
}

@end
