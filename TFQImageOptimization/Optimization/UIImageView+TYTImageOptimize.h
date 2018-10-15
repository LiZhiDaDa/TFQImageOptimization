//
//  UIImageView+TYTImageOptimize.h
//  teyuntong
//
//  Created by 王立志 on 2018/9/20.
//  Copyright © 2018年 teyuntong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (TYTImageOptimize)

///异步设置图片，省时
- (void)setImageOptimize:(NSString *)imageName;
///异步设置高亮图片，省时
- (void)setHighlightedImageOptimize:(NSString *)imageName;
@end
