//
//  UIView+EdgeShadow.m
//  CALayerShadow
//
//  Created by qq on 2018/1/10.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "UIView+EdgeShadow.h"
#import "Masonry.h"



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
// 添加阴影
-(void)addShadowEdge:(EdgeDirection)direction shadowColor:(UIColor*)color shadowOpacity:(CGFloat)opacity blurRadius:(CGFloat)radii{
    // width: 阴影宽度，或模糊半径
    
    UIView* shadowView = [self showdowView:direction blurRadius:radii];
    
    UIView* line = [self drawLineDirection:direction blurRadius:radii inView:shadowView];
    line.backgroundColor= [UIColor whiteColor];
    line.layer.shadowRadius = radii; // 模糊半径，值越小，阴影越清晰，否者阴影越淡
    line.layer.shadowColor = color.CGColor;
    line.layer.shadowOffset = CGSizeMake(0,0.5);// 阴影偏离 UIView 的偏移坐标
    line.layer.shadowOpacity = opacity;
}
// 根据指定方向在阴影区域绘制一条线
-(UIView*)drawLineDirection:(EdgeDirection)direction blurRadius:(CGFloat)radii inView:(UIView*)view{
    CGFloat corner = self.layer.cornerRadius;
    UIView* line = [UIView new];
    [view  addSubview:line];
    switch (direction) {
        case UP:
            {
                [line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(@(radii+corner));
                    make.right.equalTo(@(-radii-corner));
                    make.top.equalTo(@(radii+0.5));
                    make.height.mas_equalTo(0.5);
                }];
            }
            break;
            
        case LEFT:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(radii+corner));
                make.bottom.equalTo(@(-radii-corner));
                make.left.equalTo(@(radii+0.5));
                make.width.mas_equalTo(0.5);
            }];
        }
            break;
        case DOWN:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(radii+corner));
                make.right.equalTo(@(-radii-corner));
                make.top.equalTo(@(radii-0.5));
                make.height.mas_equalTo(0.5);
            }];
        }
            break;
        case RIGHT:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(radii+corner));
                make.bottom.equalTo(@(-radii-corner));
                make.left.equalTo(@(radii-0.5));
                make.width.mas_equalTo(0.5);
            }];
        }
    }
    return line;
}
// 计算出要添加的阴影面积
-(UIView*)showdowView:(EdgeDirection)direction blurRadius:(CGFloat)radii{
    UIView* view = [UIView new];
    CGFloat corner = self.layer.cornerRadius;
    view.layer.cornerRadius = corner;
    view.layer.masksToBounds = YES;
    [self.superview insertSubview:view belowSubview:self];
    
    switch (direction) {
        case UP:{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left);
                make.right.equalTo(self.mas_right);
                make.top.equalTo(self.mas_top).offset(-radii);
                make.height.mas_equalTo(radii*2+0.5);
            }];
            
        }
            break;
        case LEFT:{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                make.left.equalTo(self.mas_left).offset(-radii);
                make.width.mas_equalTo(radii*2+1);
            }];
        }
            break;
        case DOWN:{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left);
                make.right.equalTo(self.mas_right);
                make.top.equalTo(self.mas_bottom).offset(-radii);
                make.height.mas_equalTo(radii*2+1);
            }];
        }
            break;
        case RIGHT:{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                make.left.equalTo(self.mas_right).offset(-radii);
                make.width.mas_equalTo(radii*2+1);
            }];
            
        }
    }
    return view;
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
