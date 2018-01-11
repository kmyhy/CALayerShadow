//
//  ViewController.m
//  CALayerShadow
//
//  Created by qq on 2018/1/10.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "ViewController.h"
#import "UIView+EdgeShadow.h"
#import "UIColor+Hex.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *vwView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _vwView.layer.cornerRadius = 5;
    _vwView.layer.borderColor = [UIColor colorWithHex:0xdddddd].CGColor;
    _vwView.layer.borderWidth = 1;
    

    // 绘制 下阴影
    [_vwView addShadowEdge:DOWN shadowColor:[UIColor blackColor] shadowOpacity:1 blurRadius:4];
    // 绘制 上阴影
    [_vwView addShadowEdge:UP shadowColor:[UIColor blackColor] shadowOpacity:1 blurRadius:4];
    // 绘制 左阴影
    [_vwView addShadowEdge:LEFT shadowColor:[UIColor blackColor] shadowOpacity:1 blurRadius:4];
    // 绘制 右阴影
    [_vwView addShadowEdge:RIGHT shadowColor:[UIColor blackColor] shadowOpacity:1 blurRadius:4];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
