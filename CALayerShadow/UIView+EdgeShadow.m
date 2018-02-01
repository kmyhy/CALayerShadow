//
//  UIView+EdgeShadow.m
//  CALayerShadow
//
//  Created by qq on 2018/1/10.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "UIView+EdgeShadow.h"
#import "Masonry.h"
#import <objc/runtime.h>


@implementation UIView (EdgeShadow)

@dynamic upShadowView;
@dynamic leftShadowView;
@dynamic downShadowView;
@dynamic rightShadowView;

// MARK: - Getter/Setter
-(UIView*)upShadowView{
    return objc_getAssociatedObject(self, @selector(upShadowView));
}
-(void)setUpShadowView:(UIView *)view{
    objc_setAssociatedObject(self, @selector(upShadowView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIView*)leftShadowView{
    return objc_getAssociatedObject(self, @selector(leftShadowView));
}
-(void)setLeftShadowView:(UIView *)view{
    objc_setAssociatedObject(self, @selector(leftShadowView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIView*)downShadowView{
    return objc_getAssociatedObject(self, @selector(downShadowView));
}
-(void)setDownShadowView:(UIView *)view{
    objc_setAssociatedObject(self, @selector(downShadowView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIView*)rightShadowView{
    return objc_getAssociatedObject(self, @selector(rightShadowView));
}
-(void)setRightShadowView:(UIView *)view{
    objc_setAssociatedObject(self, @selector(rightShadowView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
// 在四周都绘制阴影
-(void)addShadowColor:(UIColor*)color shadowOpacity:(CGFloat)opacity blurRadius:(CGFloat)radii shadowOffset:(CGSize)offset{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowRadius = radii;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
}
// 添加阴影
-(void)addShadowEdge:(EdgeDirection)direction shadowColor:(UIColor*)color shadowOpacity:(CGFloat)opacity blurRadius:(CGFloat)radii{
    // width: 阴影宽度，或模糊半径
    
    UIView* shadowView = [self showdowView:direction blurRadius:radii];
    UIView* line = [self drawLineDirection:direction blurRadius:radii inView:shadowView];
    line.backgroundColor= [UIColor whiteColor];
    line.alpha = opacity;
    line.layer.shadowRadius = radii; // 模糊半径，值越小，阴影越清晰，否者阴影越淡
    line.layer.shadowColor = color.CGColor;
    line.layer.shadowOffset = CGSizeMake(0,0);// 阴影偏离 UIView 的偏移坐标
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
                    make.left.equalTo(@(corner));
                    make.right.equalTo(@(-corner));
                    make.top.equalTo(@(radii+corner/2));
                    make.height.mas_equalTo(radii);
                }];
            }
            break;
            
        case LEFT:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(corner));
                make.bottom.equalTo(@(-corner));
                make.left.equalTo(@(radii+corner/2));
                make.width.mas_equalTo(radii);
            }];
        }
            break;
        case DOWN:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(corner));
                make.right.equalTo(@(-corner));
                make.top.equalTo(@(0-corner/2));
                make.height.mas_equalTo(radii);
            }];
        }
            break;
        case RIGHT:
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(corner));
                make.bottom.equalTo(@(-corner));
                make.left.equalTo(@(0-corner/2));
                make.width.mas_equalTo(radii);
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
            [self.upShadowView removeFromSuperview];
            self.upShadowView= view;
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left);
                make.right.equalTo(self.mas_right);
                make.top.equalTo(self.mas_top).offset(-radii);
                make.height.mas_equalTo(radii*2);
            }];
            
        }
            break;
        case LEFT:{
            [self.leftShadowView removeFromSuperview];
            self.leftShadowView = view;
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                make.left.equalTo(self.mas_left).offset(-radii);
                make.width.mas_equalTo(radii*2);
            }];
        }
            break;
        case DOWN:{
            [self.downShadowView removeFromSuperview];
            self.downShadowView = view;
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left);
                make.right.equalTo(self.mas_right);
                make.top.equalTo(self.mas_bottom).offset(-radii);
                make.height.mas_equalTo(radii*2);
            }];
        }
            break;
        case RIGHT:{
            [self.rightShadowView removeFromSuperview];
            self.rightShadowView = view;
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                make.left.equalTo(self.mas_right).offset(-radii);
                make.width.mas_equalTo(radii*2);
            }];
            
        }
    }
    return view;
}
@end
