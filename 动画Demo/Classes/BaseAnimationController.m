//
//  BaseAnimationController.m
//  动画Demo
//
//  Created by m on 2017/2/7.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "BaseAnimationController.h"

@interface BaseAnimationController ()
{
    CALayer *_myLayer;
    CALayer *_myAnotherLayer;
}
@end

@implementation BaseAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSubViews];
    
}

- (void)creatSubViews
{
    self.title = @"BasicAnimation";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _myLayer = [CALayer layer];
    _myLayer.frame = CGRectMake(80, 100, 50, 50);
    _myLayer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:_myLayer];
    
    _myAnotherLayer = [CALayer layer];
    _myAnotherLayer.frame = CGRectMake(80, 200, 50, 50);
    _myAnotherLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:_myAnotherLayer];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

#if 0
    [self testAddAnimation];
    
#elif 0
    [self testOtherAnimation];
#elif 0
    [self testTimingFuncation];
#elif 1
    [self testAnimationDelegate];
#endif
    
}

- (void)testAddAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
//    basicAnimation.fromValue = @(0);
//    basicAnimation.toValue = @(100);
    basicAnimation.byValue = @(100);
    //被行重复4次
    basicAnimation.repeatDuration = 1;
    [_myLayer addAnimation:basicAnimation forKey:@"position"];
    
    basicAnimation.byValue = @(150);
    [_myAnotherLayer addAnimation:basicAnimation forKey:@"position"];
    
}

- (void)testOtherAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    basicAnimation.fromValue = @(_myLayer.position.x);
    basicAnimation.toValue = @(_myLayer.position.x + 100);
    
    basicAnimation.duration = 2;
    //显式动画覆盖隐式动画
    _myLayer.position = CGPointMake(_myLayer.position.x + 100, _myLayer.position.y);
    
    [_myLayer addAnimation:basicAnimation forKey:@"position"];

}

- (void)testTimingFuncation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.byValue = @(100);
    animation.duration = 2;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [_myLayer addAnimation:animation forKey:@"position"];
    
}

- (void)testAnimationDelegate
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.byValue = @(100);
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    [_myLayer addAnimation:animation forKey:@"position"];
    
//    [_myLayer removeAllAnimations]
}

//动画开始之前调用
- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始之前");
}

//动画结束后调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画结束之后");
    
    CAAnimation *animation = [_myLayer animationForKey:@"position"];
    if (animation) {
        NSLog(@"动画没有移除");
    }else{
        NSLog(@"动画移除");
    }
}

@end
