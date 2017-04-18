//
//  SortArithmeicHandle.m
//  SortArithmetic
//
//  Created by YZ Y on 17/4/5.
//  Copyright © 2017年 YYZ. All rights reserved.
//

#import "SortArithmeicHandle.h"

@implementation SortArithmeicHandle
/**冒泡排序*/
+ (NSArray *)bubbleSortHandle:(NSArray *)array isAscending:(BOOL)isAscending
{
    NSMutableArray *arrayM = [NSMutableArray arrayWithArray:array];
    NSUInteger length = arrayM.count;
    if (isAscending) {
        for (int i = 0; i < length - 1; i ++) {
            for (int j = 0; j < length - 1- i; j ++) {
                //相邻元素两两相比
                if (arrayM[j] > arrayM[j + 1]) {
                    //元素交换
                    id temp = arrayM[j + 1];
                    arrayM[j + 1] = arrayM[j];
                    arrayM[j] = temp;
                }
            }
        }
    } else {
        for (int i = 0; i < length - 1; i ++) {
            for (int j = 0; j < length - 1- i; j ++) {
                //相邻元素两两相比
                if (arrayM[j] < arrayM[j + 1]) {
                    //元素交换
                    id temp = arrayM[j + 1];
                    arrayM[j + 1] = arrayM[j];
                    arrayM[j] = temp;
                }
            }
        }
    }
    NSLog(@"bulleSort %@:%@", isAscending ? @"ascending" : @"desceding", arrayM);
    return arrayM;
}

/**选择排序*/
+ (NSArray *)selectionSortHandle:(NSArray *)array isAscending:(BOOL)isAscending
{
    NSMutableArray *arrayM = [NSMutableArray arrayWithArray:array];
    NSUInteger length = arrayM.count;
    NSUInteger minIndex = 0;
    NSUInteger maxIndex = 0;
    id temp = nil;
    if (isAscending) {
        for (int i = 0; i < length - 1; i ++) {
            minIndex = i;
            for (int j = i + 1; j < length; j ++) {
                //寻找最小的数
                if (arrayM[j] < arrayM[minIndex]) {
                    //保留最小数的索引
                    minIndex = j;
                }
                temp = arrayM[i];
                arrayM[i] = arrayM[minIndex];
                arrayM[minIndex] = temp;
            }
        }
    } else {
        for (int i = 0; i < length - 1; i ++) {
            maxIndex = i;
            for (int j = i + 1; j < length; j ++) {
                //寻找最大的数
                if (arrayM[j] > arrayM[maxIndex]) {
                    //保留最大数的索引
                    maxIndex = j;
                }
                temp = arrayM[i];
                arrayM[i] = arrayM[maxIndex];
                arrayM[maxIndex] = temp;
            }
        }
    }
    NSLog(@"selectionSort %@:%@", isAscending ? @"ascending" : @"desceding", arrayM);
    return arrayM;
}

/**插入排序*/
+ (NSArray *)insertionSortHandle:(NSArray *)array isAscending:(BOOL)isAscending
{
    NSMutableArray *arrayM = [NSMutableArray arrayWithArray:array];
    NSUInteger length = arrayM.count;
    NSInteger preIndex = 0;
    id currentElement = nil;
    if (isAscending) {
        for (int i = 1; i < length; i ++) {
            preIndex = i - 1;
            currentElement = arrayM[i];
            while (preIndex >= 0 && (arrayM[preIndex] < currentElement)) {
                arrayM[preIndex + 1] = arrayM[preIndex];
                preIndex --;
            }
            arrayM[preIndex + 1] = currentElement;
        }
    } else {
        for (int i = 1; i < length; i ++) {
            preIndex = i - 1;
            currentElement = arrayM[i];
            while (preIndex >= 0 && (arrayM[preIndex] > currentElement)) {
                arrayM[preIndex + 1] = arrayM[preIndex];
                preIndex --;
            }
            arrayM[preIndex + 1] = currentElement;
        }
    }
    NSLog(@"insertionSort %@:%@", isAscending ? @"ascending" : @"desceding", arrayM);
    return arrayM;
}

/**归并排序*/
+ (NSArray *)mergeSortHandle:(NSArray *)array isAscending:(BOOL)isAscending
{
    //自上而下的递归方法
    NSUInteger length = array.count;
    if (length < 2) {
        return array;
    }
    int middle = round(array.count / 2);
    NSMutableArray *arrayM = [NSMutableArray arrayWithArray:array];
    NSMutableArray *leftArray = [NSMutableArray arrayWithArray:[arrayM subarrayWithRange:NSMakeRange(0, middle)]];
    [arrayM removeObjectsInArray:leftArray];
    NSMutableArray *rightArray = [NSMutableArray arrayWithArray:arrayM];
    return [self merge: [self mergeSortHandle:leftArray isAscending:YES] rightArray:[self mergeSortHandle:rightArray isAscending:YES] isAscending:isAscending];;
}

/**合并数组*/
+ (NSArray *)merge:(NSArray *)leftArray rightArray:(NSArray *)rightArray isAscending:(BOOL)isAscending
{
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *leftArrayM = [NSMutableArray arrayWithArray:leftArray];
    NSMutableArray *rightArrayM = [NSMutableArray arrayWithArray:rightArray];
    while (leftArrayM.count && rightArrayM.count) {
        if (leftArrayM[0] <= rightArrayM[0]) {
            [array addObject:leftArrayM[0]];
            [leftArrayM removeObjectAtIndex:0];
        } else {
            [array addObject:rightArrayM[0]];
            [rightArrayM removeObjectAtIndex:0];
        }
        
        while (leftArrayM.count) {
            [array addObject:leftArrayM[0]];
            [leftArrayM removeObjectAtIndex:0];
        }
        
        while (rightArrayM.count) {
            [array addObject:rightArrayM[0]];
            [rightArrayM removeObjectAtIndex:0];
        }
    }
    NSLog(@"mergeSort %@:%@", isAscending ? @"ascending" : @"desceding", array);
    return array;
}

@end
