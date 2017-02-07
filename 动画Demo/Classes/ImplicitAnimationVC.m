//
//  ImplicitAnimationVC.m
//  动画Demo
//
//  Created by m on 2017/2/6.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "ImplicitAnimationVC.h"

@interface ImplicitAnimationVC ()

@end

@implementation ImplicitAnimationVC
{
    UIView *_myView;
    CALayer *_myLayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initSubViews];
    
}

- (void)initSubViews
{
    self.title = @"隐式动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _myView = [[UIView alloc] initWithFrame:CGRectMake(80, 100, 50, 50)];
    _myView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_myView];
    
    _myLayer = [CALayer layer];
    _myLayer.frame = CGRectMake(80, 200, 50, 50);
    _myLayer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:_myLayer];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (CGRectContainsPoint(_myView.frame, [touch locationInView:self.view])) {
        [self testAnimationUIView];
    }
    
    if (CGRectContainsPoint(_myLayer.frame, [touch locationInView:self.view])) {
        [self testAnimationLayer];
    }
}

- (void)testAnimationUIView
{
    _myView.alpha = _myView.alpha < 1 ? 1 : 0.2;
}

- (void)testAnimationLayer
{
    _myLayer.opacity = _myLayer.opacity < 1 ? 1 : 0.2;
}


@end
