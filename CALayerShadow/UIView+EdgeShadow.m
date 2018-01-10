//
//  UIView+EdgeShadow.m
//  CALayerShadow
//
//  Created by qq on 2018/1/10.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "UIView+EdgeShadow.h"

@implementation UIView (EdgeShadow)
// 添加上阴影- 注意 width 越宽，好像阴影越淡
-(void)addTopShadowColor:(UIColor*)color opacity:(CGFloat)opacity width:(CGFloat)width corner:(CGFloat)corner{
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y-width, self.frame.size.width, width*2+1)];
    view.layer.cornerRadius = corner;
    view.layer.masksToBounds = YES;
    [self.superview insertSubview:view belowSubview:self];

    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = CGRectMake(0, width,view.frame.size.width,1);
    shadowLayer.shadowRadius = width;
    shadowLayer.shadowColor = color.CGColor;
    shadowLayer.shadowOffset = CGSizeMake(0, 0);
    shadowLayer.shadowOpacity = opacity;
    shadowLayer.shadowPath = [UIBezierPath bezierPathWithRect:shadowLayer.bounds].CGPath;
    
    [view.layer addSublayer:shadowLayer];
}
// 添加下阴影
-(void)addDownShadowColor:(UIColor*)color opacity:(CGFloat)opacity width:(CGFloat)width corner:(CGFloat)corner{
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame)-width, self.frame.size.width, width*2+1)];
    view.layer.cornerRadius = corner;
    view.layer.masksToBounds = YES;
    [self.superview insertSubview:view belowSubview:self];
    
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = CGRectMake(0, width,view.frame.size.width,1);
    shadowLayer.shadowRadius = width;
    shadowLayer.shadowColor = color.CGColor;
    shadowLayer.shadowOffset = CGSizeMake(0,0);
    shadowLayer.shadowOpacity = opacity;
    shadowLayer.shadowPath = [UIBezierPath bezierPathWithRect:shadowLayer.bounds].CGPath;
    
    [view.layer addSublayer:shadowLayer];
}
// 添加左阴影
-(void)addLeftShadowColor:(UIColor*)color opacity:(CGFloat)opacity width:(CGFloat)width corner:(CGFloat)corner{
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.frame)-width, CGRectGetMinY(self.frame), width*2+1,self.frame.size.height)];
    view.layer.cornerRadius = corner;
    view.layer.masksToBounds = YES;
    [self.superview insertSubview:view belowSubview:self];
    
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = CGRectMake(width,0,1,view.frame.size.height);
    shadowLayer.shadowRadius = width;
    shadowLayer.shadowColor = color.CGColor;
    shadowLayer.shadowOffset = CGSizeMake(0,0);
    shadowLayer.shadowOpacity = opacity;
    shadowLayer.shadowPath = [UIBezierPath bezierPathWithRect:shadowLayer.bounds].CGPath;
    
    [view.layer addSublayer:shadowLayer];
}
// 添加右阴影
-(void)addRightShadowColor:(UIColor*)color opacity:(CGFloat)opacity width:(CGFloat)width corner:(CGFloat)corner{
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.frame)-width, CGRectGetMinY(self.frame), width*2+1,self.frame.size.height)];
    view.layer.cornerRadius = corner;
    view.layer.masksToBounds = YES;
    [self.superview insertSubview:view belowSubview:self];
    
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = CGRectMake(width,0,1,view.frame.size.height);
    shadowLayer.shadowRadius = width;
    shadowLayer.shadowColor = color.CGColor;
    shadowLayer.shadowOffset = CGSizeMake(0,0);
    shadowLayer.shadowOpacity = opacity;
    shadowLayer.shadowPath = [UIBezierPath bezierPathWithRect:shadowLayer.bounds].CGPath;
    
    [view.layer addSublayer:shadowLayer];
}
@end
