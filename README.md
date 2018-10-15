# TFQImageOptimization
查找图片优化


博客地址：https://juejin.im/post/5bc45a246fb9a05d02611e50

使用方法：
```
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

```
