//
//  SortArithmeicHandle.h
//  SortArithmetic
//
//  Created by YZ Y on 17/4/5.
//  Copyright © 2017年 YYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortArithmeicHandle : NSObject
/**冒泡排序*/
+ (NSArray *)bubbleSortHandle:(NSArray *)array isAscending:(BOOL)isAscending;
/**选择排序*/
+ (NSArray *)selectionSortHandle:(NSArray *)array isAscending:(BOOL)isAscending;
/**插入排序*/
+ (NSArray *)insertionSortHandle:(NSArray *)array isAscending:(BOOL)isAscending;
/**归并排序*/
+ (NSArray *)mergeSortHandle:(NSArray *)array isAscending:(BOOL)isAscending;

@end
