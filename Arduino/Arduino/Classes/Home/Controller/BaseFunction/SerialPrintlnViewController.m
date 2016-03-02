//
//  SerialPrintlnViewController.m
//  Arduino
//
//  Created by 李晓 on 16/3/2.
//  Copyright © 2016年 yanyang. All rights reserved.
//

#import "SerialPrintlnViewController.h"

@interface SerialPrintlnViewController ()

@end

@implementation SerialPrintlnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"文字输入展示"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITextView *textView = [UITextView newAutoLayoutView];
    textView.layer.borderWidth = 0.5;
    textView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    textView.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:textView];
    [textView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(80, 20, 0, 20) excludingEdge:ALEdgeBottom];
    [textView autoSetDimension:ALDimensionHeight toSize:180];
    
    BlockButton *btn = [BlockButton newAutoLayoutView];
    [self.view addSubview:btn];
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    btn.backgroundColor = kRGBColor(23, 160, 166, 1);
    [btn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:textView withOffset:25];
    [btn autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [btn autoSetDimensionsToSize:CGSizeMake(120, 40)];
    btn.ClickOption = ^{
    
    
    
    };
    
}

@end
