//
//  UIButton+TYTImageOptimize.m
//  teyuntong
//
//  Created by 王立志 on 2018/9/20.
//  Copyright © 2018年 teyuntong. All rights reserved.
//

#import "UIButton+TYTImageOptimize.h"
#import "TYTOptimizationPrograms.h"

typedef NS_ENUM(NSInteger, TYTImageType){
    TYTImageTypeNormal = 0, //正常图片
    TYTImageTypeBackground = 1 //背景图片
};

@implementation UIButton (TYTImageOptimize)

static dispatch_queue_t queue;

///异步设置image,省时
- (void)setImageOptimize:(NSString *)imageName forState:(UIControlState)state{
    [self imageOptimize:imageName forState:state andImageType:TYTImageTypeNormal];
}

///异步设置backgroundImage,省时
- (void)setBackgroundImageOptimize:(NSString *)imageName forState:(UIControlState)state{
    [self imageOptimize:imageName forState:state andImageType:TYTImageTypeBackground];
}

///异步查到图片，回到主线程设置给button
- (void)imageOptimize:(NSString *)imageName forState:(UIControlState)state andImageType:(TYTImageType)imageType{
    __block UIImage *image = nil;
    [TYTOptimizationPrograms optimizeChildThreadOperation:^{
        NSString *path = [NSString stringWithFormat:@"%@/%@",[NSBundle mainBundle].bundlePath, imageName];
        image = [UIImage imageWithContentsOfFile:path];
        if(image == nil){
            //Images.xcassets中的图片资源只能通过imageNamed:方法加载
            //官方解释：In iOS 9 and later, this method is thread safe.
            //iOS9以下很小概率会crash或者返回nil
            image = [UIImage imageNamed:imageName];
        }
    } toMainThreadOperation:^{
        switch (imageType) {
            case TYTImageTypeNormal:
                [self setImage:image forState:state];
                break;
            case TYTImageTypeBackground:
                [self setBackgroundImage:image forState:state];
                break;
            default:
                break;
        }
    }];
}

@end
