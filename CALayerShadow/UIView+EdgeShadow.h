//
//  UIView+EdgeShadow.h
//  CALayerShadow
//
//  Created by qq on 2018/1/10.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface UIView (EdgeShadow)

// 添加上阴影
-(void)addTopShadowColor:(UIColor*)color opacity:(CGFloat)opacity width:(CGFloat)width corner:(CGFloat)corner;
// 添加下阴影
-(void)addDownShadowColor:(UIColor*)color opacity:(CGFloat)opacity width:(CGFloat)width corner:(CGFloat)corner;
// 添加左阴影
-(void)addLeftShadowColor:(UIColor*)color opacity:(CGFloat)opacity width:(CGFloat)width corner:(CGFloat)corner;
// 添加右阴影
-(void)addRightShadowColor:(UIColor*)color opacity:(CGFloat)opacity width:(CGFloat)width corner:(CGFloat)corner;
@end
