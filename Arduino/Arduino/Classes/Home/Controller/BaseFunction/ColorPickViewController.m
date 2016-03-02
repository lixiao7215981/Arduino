//
//  ColorPickViewController.m
//  Arduino
//
//  Created by 李晓 on 16/3/2.
//  Copyright © 2016年 yanyang. All rights reserved.
//

#import "ColorPickViewController.h"
#import "RSColorPickerView.h"
#import "RSColorFunctions.h"

@interface ColorPickViewController ()<RSColorPickerViewDelegate>
{
    UIView *_colorView;
    UILabel *_label;
    NSString *_colorNumber;
}

@property (nonatomic) RSColorPickerView *colorPicker;

@end

@implementation ColorPickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"颜色选择"];
    
    _colorPicker = [[RSColorPickerView alloc] initWithFrame:CGRectMake((kWindowWidth - 300) * 0.5, 70.0, 300, 300)];
    [_colorPicker setSelectionColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:1.000000]];
    // 设置成圆形的颜色选择器
    _colorPicker.cropToCircle = YES;
    [_colorPicker setBrightness:MAXFLOAT];
    [_colorPicker setDelegate:self];
    [self.view addSubview:_colorPicker];
    
    _label = [UILabel newAutoLayoutView];
    [self.view addSubview:_label];
    [_label autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:385];
    [_label autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_label autoSetDimension:ALDimensionWidth toSize:170];
    [_label autoSetDimension:ALDimensionHeight toSize:30];
    
    _colorView = [UIView newAutoLayoutView];
    [self.view addSubview:_colorView];
    [_colorView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_label];
    [_colorView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_label];
    [_colorView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_colorView autoSetDimension:ALDimensionHeight toSize:30];
    _colorView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _colorView.layer.borderWidth = 0.5;
    
    CGFloat width = (kWindowWidth - 80) / 3;
    CGFloat height = 30;
    __weak typeof(self) weakSelf = self;
    
    BlockButton *redBtn = [BlockButton newAutoLayoutView];
    [self.view addSubview:redBtn];
    redBtn.backgroundColor = [UIColor redColor];
    [redBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [redBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_colorView withOffset:20];
    [redBtn autoSetDimensionsToSize:CGSizeMake(width, height)];
    redBtn.ClickOption = ^{
        [weakSelf sendColorBEL:@"255,0,0"];
    };
    
    BlockButton *greenBtn = [BlockButton newAutoLayoutView];
    [self.view addSubview:greenBtn];
    greenBtn.backgroundColor = [UIColor greenColor];
    [greenBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:redBtn];
    [greenBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:redBtn withOffset:20];
    [greenBtn autoSetDimensionsToSize:CGSizeMake(width, height)];
    greenBtn.ClickOption = ^{
        [weakSelf sendColorBEL:@"0,255,0"];
    };
    
    BlockButton *blueBtn = [BlockButton newAutoLayoutView];
    [self.view addSubview:blueBtn];
    blueBtn.backgroundColor = [UIColor blueColor];
    [blueBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [blueBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:redBtn];
    [blueBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:greenBtn withOffset:20];
    [blueBtn autoSetDimensionsToSize:CGSizeMake(width, height)];
    blueBtn.ClickOption = ^{
        [weakSelf sendColorBEL:@"0,0,255"];
    };
}

#pragma mark - RSColorPickerViewDelegate

- (void)colorPickerDidChangeSelection:(RSColorPickerView *)cp {
    
    // Get color data
    UIColor *color = [cp selectionColor];
    
    CGFloat r, g, b, a;
    [[cp selectionColor] getRed:&r green:&g blue:&b alpha:&a];
    _colorView.backgroundColor = color;
    
    // Debug
    NSString *colorDesc = [NSString stringWithFormat:@"rgba: %f, %f, %f, %f", r, g, b, a];
    //    NSLog(@"%@", colorDesc);
    
    int ir = r * 255;
    int ig = g * 255;
    int ib = b * 255;
    //    int ia = a * 255;
    colorDesc = [NSString stringWithFormat:@"RGB : %d , %d , %d", ir, ig, ib];
    _label.text = colorDesc;
    _colorNumber = [NSString stringWithFormat:@"%d,%d,%d",ir,ig,ib];
    //    NSLog(@"%@", colorDesc);
    //    NSLog(@"%@", NSStringFromCGPoint(cp.selection));
}

- (void)colorPicker:(RSColorPickerView *)colorPicker touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self sendColorBEL:_colorNumber];
}

#pragma mark - SendCoedBEL

- (void) sendColorBEL:(NSString *)rgb
{
    NSLog(@"%@", rgb);
}


@end
