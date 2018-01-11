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

-(void)addShadowEdge:(EdgeDirection)direction shadowColor:(UIColor*)color shadowOpacity:(CGFloat)opacity blurRadius:(CGFloat)radii;
@end
