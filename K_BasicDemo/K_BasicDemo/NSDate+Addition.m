//
//  NSDate+Addition.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/14.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "NSDate+Addition.h"

@implementation NSDate (Addition)


- (NSString *)stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    //zzz 表示时区,  zzz可以删除, 这样返回的日期字符将不包含时区信息
    // yyyy-MM-dd  HH:mm:ss zzz
    [dateFormatter setDateFormat:dateFormat];
    NSString * destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

- (BOOL)isYesterday
{
    NSDate * now = [NSDate date];
    NSDate * date = self;
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd";
    NSString * createdDate = [format stringFromDate:self];
    NSString * nowDate = [format stringFromDate:now];
    date = [format dateFromString:createdDate];
    now = [format dateFromString:nowDate];
    NSCalendar * celendar = [NSCalendar currentCalendar];   //日历
    NSDateComponents * Components = [celendar components:NSCalendarUnitMonth | NSCalendarUnitDay fromDate:now toDate:date options:0];
    return Components.month == 0 && Components.day == 1 && Components.year == 0;
}

- (BOOL)isToday
{
    NSDate * now = [NSDate date];
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd";
    NSString * nowDate = [format stringFromDate:now];
    NSString * createDate = [format stringFromDate:self];
    
    return [nowDate isEqualToString:createDate];
}


- (BOOL)isThisYear
{
    //创建日历进行对比
    NSCalendar * calendar = [NSCalendar currentCalendar];

    //获取当前数据年
    NSDateComponents * created = [calendar components:NSCalendarUnitYear fromDate:self];
    
    NSDateComponents * now = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return created.year == now.year;
}



@end
