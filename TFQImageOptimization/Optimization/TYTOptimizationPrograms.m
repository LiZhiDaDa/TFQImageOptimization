//
//  TYTOptimizationPrograms.m
//  teyuntong
//
//  Created by 王立志 on 2018/10/15.
//  Copyright © 2018年 teyuntong. All rights reserved.
//

#import "TYTOptimizationPrograms.h"

@implementation TYTOptimizationPrograms

///在子线程做耗时操作然后把结果带回到主线程
+ (void)optimizeChildThreadOperation:(childThreadOperation)childThreadOperation toMainThreadOperation:(mainThreadOperation)mainThreadOperation{
    [self childThreadOperation:childThreadOperation mainThreadOperation:mainThreadOperation];
}

///主线程异步进行耗时操作
+ (void)optimizeAsyncMainThreadOperation:(mainThreadOperation)mainThreadOperation{
    [self childThreadOperation:nil mainThreadOperation:mainThreadOperation];
}

+ (void)childThreadOperation:(childThreadOperation)chileThreadOperation mainThreadOperation:(mainThreadOperation)mainThreadOperation{
    dispatch_queue_t queue = dispatch_queue_create("optimizeImageQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        if(chileThreadOperation){
            chileThreadOperation();
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if(mainThreadOperation){
                mainThreadOperation();
            }
        });
    });
}

@end
