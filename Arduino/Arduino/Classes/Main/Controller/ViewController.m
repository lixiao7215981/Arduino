//
//  ViewController.m
//  Arduino
//
//  Created by 李晓 on 16/3/1.
//  Copyright © 2016年 yanyang. All rights reserved.
//

#import "ViewController.h"
#import "ColorPickViewController.h"
#import "SerialPrintlnViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"Arduino"];
    
    [self addDataList];
}


- (void) addDataList
{
    BaseArrowCellItem *colorPick = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"颜色选择器" SubTitle:nil ClickOption:^{
        ColorPickViewController *colorPickViewController = [[ColorPickViewController alloc] init];
        colorPickViewController.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:colorPickViewController animated:YES];
    }];
    
    BaseArrowCellItem *serial = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"文字输入展示" SubTitle:nil ClickOption:^{
        SerialPrintlnViewController *serialPrint = [[SerialPrintlnViewController alloc] init];
        serialPrint.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:serialPrint animated:YES];
    }];
    
    
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[colorPick,serial]];
    [self.dataList addObject:group];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
