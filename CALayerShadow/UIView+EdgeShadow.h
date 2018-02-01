//
//  UIView+EdgeShadow.h
//  CALayerShadow
//
//  Created by qq on 2018/1/10.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    UP,
    LEFT,
    DOWN,
    RIGHT,
} EdgeDirection;

@interface UIView (EdgeShadow)

@property(nonatomic,strong)UIView* upShadowView;
@property(nonatomic,strong)UIView* leftShadowView;
@property(nonatomic,strong)UIView* downShadowView;
@property(nonatomic,strong)UIView* rightShadowView;

// 调用示例：[_vwView addShadowEdge:DOWN shadowColor:[UIColor blackColor] shadowOpacity:1 blurRadius:4];
-(void)addShadowEdge:(EdgeDirection)direction shadowColor:(UIColor*)color shadowOpacity:(CGFloat)opacity blurRadius:(CGFloat)radii;
// 上面方法的变异方法
-(void)addShadowEdge:(EdgeDirection)direction shadowColor:(UIColor*)color shadowOpacity:(CGFloat)opacity blurRadius:(CGFloat)radii offset:(CGFloat)offset;
// 调用示例： [_vwView addShadowColor:[UIColor blackColor] shadowOpacity:0.2 blurRadius:2 shadowOffset:CGSizeZero];
-(void)addShadowColor:(UIColor*)color shadowOpacity:(CGFloat)opacity blurRadius:(CGFloat)radii shadowOffset:(CGSize)offset;
@end
