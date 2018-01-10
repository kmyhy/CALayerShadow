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

    [_vwView addTopShadowColor:[UIColor blackColor] opacity:1 width:8 corner:16];
    [_vwView addDownShadowColor:[UIColor blackColor] opacity:1 width:8 corner:16];
    [_vwView addLeftShadowColor:[UIColor blackColor] opacity:1 width:8 corner:16];
    [_vwView addRightShadowColor:[UIColor blackColor] opacity:1 width:8 corner:16];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
