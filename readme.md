# 为 UIView 添加任意一边的阴影

和用 CALayer 的 shadowXXX 属性绘制的阴影不同，这个方法可以只绘制 UIView 任意一边的阴影，而不是 4 边阴影都绘制。如下图所示，只绘制了上下两边的阴影（当然也可以只绘制上阴影或下阴影）：

<img src="1.png" width="240"/>

## 用法

导入头文件：#import "UIView+EdgeShadow.h"

调用 addShadowEdge 方法：

```swift
// 绘制 下阴影
    [_vwView addShadowEdge:DOWN shadowColor:[UIColor blackColor] shadowOpacity:1 blurRadius:4];
    // 绘制 上阴影
    [_vwView addShadowEdge:UP shadowColor:[UIColor blackColor] shadowOpacity:1 blurRadius:4];
    // 绘制 左阴影
    [_vwView addShadowEdge:LEFT shadowColor:[UIColor blackColor] shadowOpacity:1 blurRadius:4];
    // 绘制 右阴影
    [_vwView addShadowEdge:RIGHT shadowColor:[UIColor blackColor] shadowOpacity:1 blurRadius:4];
```

