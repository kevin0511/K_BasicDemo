//
//  BDUserInfoModel.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/10.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDBasicModel.h"
#import "MJExtension.h"
#import "BDFileCacheManager.h"

@implementation BDBasicModel

MJCodingImplementation;

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"ID":@"id",
             @"desc":@"description",
             @"responseData":@"data"
             };
}

+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response
{
    if ([response isKindOfClass:[NSArray class]])
    {
        NSMutableArray * array = [self mj_objectArrayWithKeyValuesArray:response];
        return array;
    }
    return [NSMutableArray new];
}

+ (id)modelWithDictionary:(NSDictionary *)dictionary
{
    if ([dictionary isKindOfClass:[NSDictionary class]])
    {
        return [self mj_objectWithKeyValues:dictionary];
    }
    return [[self alloc] init];
}

+ (void)setUpModelClassInArrayWithContainDict:(NSDictionary *)dict
{
    if (dict.allKeys.count == 0) {
        return;
    }
    
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return dict;
    }];
}

+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response containDict:(NSDictionary *)dict
{
    if (dict == nil) {
        dict = [NSMutableDictionary new];
    }
    [self setUpModelClassInArrayWithContainDict:dict];
    return [self modelArrayWithDictArray:response];
}

+ (id)modelWithDictionary:(NSDictionary *)dictionary containDict:(NSDictionary *)dict
{
    if (dict == nil) {
        dict = [NSMutableDictionary new];
    }
    [self setUpModelClassInArrayWithContainDict:dict];
    return [self modelWithDictionary:dict];
}

#warning Q5
- (id)unarchiver
{
    id obj = [BDFileCacheManager getObjectByFileName:[self.class description]];
    return obj;
}

- (void)archive
{
    [BDFileCacheManager saveObject:self byFileName:[self.class description]];
}

- (void)remove
{
    [BDFileCacheManager removeObjectByFileName:[self.class description]];
}

@end
