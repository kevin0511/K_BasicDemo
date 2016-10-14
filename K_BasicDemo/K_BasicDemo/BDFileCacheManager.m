//
//  BDFileCacheManager.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/10.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDFileCacheManager.h"
#import "NSFileManager+Paths.h"

@implementation BDFileCacheManager

// 把对象归档存到沙盒里
+ (BOOL)saveObject:(id)object byFileName:(NSString *)fileName
{
    NSString * path = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    BOOL success = [NSKeyedArchiver archiveRootObject:object toFile:path];
    return success;
}
// 通过文件名从沙盒中找到归档的对象
+ (id)getObjectByFileName:(NSString *)fileName
{
    NSString * path = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return obj;
}

// 根据文件名删除沙盒中的文件
+ (void)removeObjectByFileName:(NSString *)fileName
{
    NSString * path = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

+ (NSString *)appendFileName:(NSString *)fileName
{
    NSString * cachesPath = [NSFileManager cachesPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachesPath isDirectory:nil])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:cachesPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return cachesPath;
}


#warning Q4
+ (NSString *)appendFilePath:(NSString *)fileName
{
    // 1.沙盒缓存路径
    NSString * cachesPath = [NSFileManager cachesPath];
    NSString * filePath = [NSString stringWithFormat:@"%@/%@",cachesPath,fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:nil])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return filePath;
}


+ (void)saveUserData:(id)data forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)readUserDataForKey:(NSString *)key
{
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return obj;
}

+ (void)removeUserDataForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}














@end
