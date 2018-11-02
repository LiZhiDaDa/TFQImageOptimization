//
//  ViewController.m
//  TFQImageOptimization
//
//  Created by 王立志 on 2018/10/15.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "ViewController.h"
#import "TYTOptimizationPrograms.h"
#import "UIButton+TYTImageOptimize.h"
#import "UIImageView+TYTImageOptimize.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //情况一：主线程异步执行耗时操作
    [TYTOptimizationPrograms optimizeAsyncMainThreadOperation:^{
        //这里可以放耗时操作
    }];
    
    //情况二：子线程执行耗时操作然后回到主线程更新UI
    __block id object = nil;
    [TYTOptimizationPrograms optimizeChildThreadOperation:^{
        //耗时操作，解析xml、查找图片、创建大型控件等；
        id result = @"result";//这是异步获取的结果
        object = result;
    } toMainThreadOperation:^{
        //带数据去主线程更新UI
        //[self.view addSubview:object];  balabalabala...
    }];
    
    //情况三：给button设置图片
    UIButton *button = [[UIButton alloc] init];
    [button setImageOptimize:@"test" forState:UIControlStateNormal];
    [button setBackgroundImageOptimize:@"test" forState:UIControlStateNormal];
    
    //情况四：给imageView设置图片
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImageOptimize:@"test"];
    [imageView setHighlightedImageOptimize:@"test"];
    
    imageView.frame = CGRectMake(40, 40, 108, 192);
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
