//
//  additiveAnimationController.m
//  动画Demo
//
//  Created by m on 2017/2/7.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "additiveAnimationController.h"

@interface additiveAnimationController ()
{
    UIView *_myView;
}
@end

@implementation additiveAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self creatSubViews];
}

- (void)creatSubViews
{
    self.title = @"additiveAnimation";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _myView = [UIView new];
    _myView.frame = CGRectMake(80, 100, 50, 50);
    _myView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_myView];
    
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse animations:^{
        _myView.center = CGPointMake(_myView.center.x + 150, _myView.center.y + 150);
    } completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testitiveAnimation];
}

- (void)testitiveAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.duration = 0.25;
    animation.fromValue = @(0);
    animation.toValue = @(100);
    animation.autoreverses = YES;
    //使用这个就需要2个数值
    animation.additive = YES;
    [_myView.layer addAnimation:animation forKey:@"additiveAnimation"];
}

@end
