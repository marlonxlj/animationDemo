//
//  PresentationTreeViewController.m
//  动画Demo
//
//  Created by m on 2017/2/6.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "PresentationTreeViewController.h"

@interface PresentationTreeViewController ()
{
    UIView *_myView;
    NSTimer *_timer;
}
@end

@implementation PresentationTreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSubViews];
}

- (void)creatSubViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    _myView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
    
    [self.view addSubview:_myView];
    _myView.backgroundColor = [UIColor orangeColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testPresentation];
}


- (void)testPresentation
{
    [UIView animateWithDuration:1 animations:^{
        _myView.center = CGPointMake(_myView.center.x + 100, _myView.center.y);
    } completion:^(BOOL finished) {
        [_timer invalidate];
    }];
    
    [self startTimer];
}

- (void)startTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    [_timer fire];
    
}

- (void)timer:(NSTimer *)timer
{
    CGFloat currentValue = ((CALayer *)[_myView.layer presentationLayer]).position.x;
    CGFloat modelValue =  ((CALayer *)[_myView.layer modelLayer]).position.x;
    
    NSLog(@"presentation:%f, modelLayer:%f",currentValue, modelValue);
    
}

@end
