//
//  UIButton+TYTImageOptimize.h
//  teyuntong
//
//  Created by 王立志 on 2018/9/20.
//  Copyright © 2018年 teyuntong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TYTImageOptimize)

///异步设置image，省时
- (void)setImageOptimize:(NSString *)imageName forState:(UIControlState)state;
///异步设置backgroundImage,省时
- (void)setBackgroundImageOptimize:(NSString *)imageName forState:(UIControlState)state;

@end
