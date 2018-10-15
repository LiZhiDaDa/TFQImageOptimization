//
//  UIImageView+TYTImageOptimize.m
//  teyuntong
//
//  Created by 王立志 on 2018/9/20.
//  Copyright © 2018年 teyuntong. All rights reserved.
//

#import "UIImageView+TYTImageOptimize.h"

typedef NS_ENUM(NSInteger, TYTImageType){
    TYTImageTypeNormal = 0, //正常图片
    TYTImageTypeHighlighted = 1 //背景图片
};

@implementation UIImageView (TYTImageOptimize)

///异步设置图片，省时
- (void)setImageOptimize:(NSString *)imageName{
    [self setImage:imageName andImageType:TYTImageTypeNormal];
}

///异步设置高亮图片，省时
- (void)setHighlightedImageOptimize:(NSString *)imageName{
    [self setImage:imageName andImageType:TYTImageTypeHighlighted];
}

///子线程查找图片，异步回到主线程设置给imageView
- (void)setImage:(NSString *)imageName andImageType:(TYTImageType)imageType{
    __block UIImage *image = nil;
    [TYTOptimizationPrograms optimizeChildThreadOperation:^{
        NSString *path = [NSString stringWithFormat:@"%@/%@",[NSBundle mainBundle].bundlePath, imageName];
        image = [UIImage imageWithContentsOfFile:path];
        if(image == nil){
            //Images.xcassets中的图片资源只能通过imageNamed:方法加载
            image = [UIImage imageNamed:imageName];
        }
    } toMainThreadOperation:^{
        switch (imageType) {
            case TYTImageTypeNormal:
                self.image = image;
                break;
            case TYTImageTypeHighlighted:
                self.highlightedImage = image;
                break;
            default:
                break;
        }
    }];
}

@end
