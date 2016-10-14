//
//  NSArray+Addition.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/14.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "NSArray+Addition.h"

@implementation NSArray (Addition)

- (instancetype)noRepeatArray
{
    return [self newArrayWithArray:self.mutableCopy];
}

- (NSMutableArray *)newArrayWithArray:(NSMutableArray *)array
{
    NSMutableArray * newArray = [NSMutableArray new];
    
    for (unsigned i = 0; i < [array count]; i++) {
        if (![newArray containsObject:array[i]]) {
            [newArray addObject:array[i]];
        }
    }
    return newArray;
}

@end
