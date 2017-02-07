//
//  CALayer+AnimationControl.h
//  动画Demo
//
//  Created by m on 2017/2/7.
//  Copyright © 2017年 XLJ. All rights reserved.
// 动画的暂停和播放
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (AnimationControl)
//动画暂停
- (void)ac_pause;
//动画恢复
- (void)ac_resume;
@end
