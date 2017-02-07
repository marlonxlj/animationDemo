//
//  MediaTimingViewController.m
//  动画Demo
//
//  Created by m on 2017/2/7.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "MediaTimingViewController.h"

@interface MediaTimingViewController ()
{
    CALayer *_myLayer;
}
@end

@implementation MediaTimingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSubViews];
}

- (void)creatSubViews
{
    self.title = @"MediaTiming";
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"Media timing before:%lf", CACurrentMediaTime());
    
    _myLayer = [CALayer layer];
    
    NSLog(@"after:%lf",CACurrentMediaTime());
    _myLayer.frame = CGRectMake(80, 100, 50, 50);
    _myLayer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:_myLayer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testMediaTiming];
}

- (void)testMediaTiming
{
    //创建动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.fromValue = @(_myLayer.position.x);
    animation.toValue = @(_myLayer.position.x + 100);
    animation.duration = 4;
    //延迟1秒后执行，在layer创建之后
    //当前layer创建之后，1秒后再执行动画
//    animation.beginTime = [_myLayer convertTime:CACurrentMediaTime() fromLayer:nil] + 1;
    //让整个动画加速
//    animation.speed = 2;
    //从中间开始做后面的动画，做完之后再做前面的动画;改变动画的顺序。不受speed的限制
    animation.timeOffset = 2;
    [_myLayer addAnimation:animation forKey:@"position"];
    
}

@end
