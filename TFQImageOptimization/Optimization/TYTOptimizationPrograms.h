//
//  TYTOptimizationPrograms.h
//  teyuntong
//
//  Created by 王立志 on 2018/10/15.
//  Copyright © 2018年 teyuntong. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^childThreadOperation)(void);
typedef void(^mainThreadOperation)(void);

@interface TYTOptimizationPrograms : NSObject

///在子线程做耗时操作然后回把结果带回到主线程
+ (void)optimizeChildThreadOperation:(childThreadOperation)childThreadOperation toMainThreadOperation:(mainThreadOperation)mainThreadOperation;

///主线程异步进行耗时操作
+ (void)optimizeAsyncMainThreadOperation:(mainThreadOperation)mainThreadOperation;


@end
