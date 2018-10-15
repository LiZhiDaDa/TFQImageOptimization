# TFQImageOptimization

具体解释见文章[APP查找图片优化](https://juejin.im/post/5bc45a246fb9a05d02611e50)

### 使用方法：
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
### 期待：
有什么问题请Issues我，或者到掘金去给我评论，一定及时回复。

有什么想法也可以Pull requests，想法好一定同意commit
