//
//  NSDate+Addition.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/14.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)

/**
 *  判断是否为昨天
 */
- (BOOL)isYesterday;

/**
 *  判断是否为今天
 */
- (BOOL)isToday;

/**
 *  判断是否为今年
 */
- (BOOL)isThisYear;

- (NSString *)stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat;


@end
