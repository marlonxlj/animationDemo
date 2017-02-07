//
//  CALayer+AnimationControl.m
//  动画Demo
//
//  Created by m on 2017/2/7.
//  Copyright © 2017年 XLJ. All rights reserved.
// 
//

#import "CALayer+AnimationControl.h"

@implementation CALayer (AnimationControl)

- (void)ac_pause
{
    CFTimeInterval localTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    //暂停需要把speed置为0,
    self.speed = 0;
    //时间为当前时间
    self.timeOffset = localTime;
}

- (void)ac_resume
{
    //最后一次的时间为timeOffset
    CFTimeInterval lastLocalTime = self.timeOffset;
    //恢复需要把speed置为非0
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval localTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.beginTime = localTime - lastLocalTime;
}

@end
