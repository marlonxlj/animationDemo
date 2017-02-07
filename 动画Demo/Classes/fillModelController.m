//
//  fillModelController.m
//  动画Demo
//
//  Created by m on 2017/2/7.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "fillModelController.h"

@interface fillModelController ()
{
    CALayer *_myLayer;
}
@end

@implementation fillModelController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSubViews];
}

- (void)creatSubViews
{
    self.title = @"Fill Model";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _myLayer = [CALayer layer];
    _myLayer.frame = CGRectMake(80, 100, 50, 50);
    _myLayer.borderColor = [UIColor blueColor].CGColor;
    _myLayer.borderWidth = 1;
    [self.view.layer addSublayer:_myLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testChangeColor];
}

- (void)testChangeColor
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.fromValue = (id)[UIColor yellowColor].CGColor;
    animation.toValue = (id)[UIColor orangeColor].CGColor;
    animation.duration = 2;
    animation.beginTime = [_myLayer convertTime:CACurrentMediaTime() fromLayer:nil] + 1;
    animation.fillMode = kCAFillModeBoth;
    animation.removedOnCompletion = NO;
    [_myLayer addAnimation:animation forKey:@"backgroundColor"];
    
    
}


@end
