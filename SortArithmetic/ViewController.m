//
//  ViewController.m
//  SortArithmetic
//
//  Created by YZ Y on 17/4/5.
//  Copyright © 2017年 YYZ. All rights reserved.
//

#define win_width [UIScreen mainScreen].bounds.size.width
#define win_height [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "UIButton+YYButton.h"
#import "SortArithmeicHandle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *bulleButton = [UIButton buttonWithTitle:@"冒泡排序" target:self action:@selector(bulleSort:) frame:CGRectMake(50, 80, win_width - 100, 60)];
    [self.view addSubview:bulleButton];
    
    UIButton *selectionButton = [UIButton buttonWithTitle:@"选择排序" target:self action:@selector(selectionSort:) frame:CGRectMake(50, 200, win_width - 100, 60)];
    [self.view addSubview:selectionButton];
    
    UIButton *insertionButton = [UIButton buttonWithTitle:@"插入排序" target:self action:@selector(insertionSort:) frame:CGRectMake(50, 300, win_width - 100, 60)];
    [self.view addSubview:insertionButton];
    
    UIButton *mergeButton = [UIButton buttonWithTitle:@"归并排序" target:self action:@selector(mergeSort:) frame:CGRectMake(50, 400, win_width - 100, 60)];
    [self.view addSubview:mergeButton];

}

- (void)bulleSort:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    [SortArithmeicHandle bubbleSortHandle:@[@(2), @(3), @(1), @(5), @(4)] isAscending:sender.selected];
}

- (void)selectionSort:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    [SortArithmeicHandle selectionSortHandle:@[@(2), @(3), @(1), @(5), @(4)] isAscending:sender.selected];
}

- (void)insertionSort:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    [SortArithmeicHandle insertionSortHandle:@[@(2), @(3), @(1), @(5), @(4)] isAscending:sender.selected];
}

- (void)mergeSort:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    [SortArithmeicHandle mergeSortHandle:@[@(2), @(3), @(1), @(5), @(4)] isAscending:sender.selected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
