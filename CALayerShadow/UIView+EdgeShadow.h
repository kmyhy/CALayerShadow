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

-(void)addShadowEdge:(EdgeDirection)direction shadowColor:(UIColor*)color shadowOpacity:(CGFloat)opacity blurRadius:(CGFloat)radii;

-(void)addShadowColor:(UIColor*)color shadowOpacity:(CGFloat)opacity blurRadius:(CGFloat)radii shadowOffset:(CGSize)offset;
@end
