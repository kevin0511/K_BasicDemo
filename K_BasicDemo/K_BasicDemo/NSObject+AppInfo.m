//
//  NSObject+AppInfo.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/17.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "NSObject+AppInfo.h"
#import <sys/utsname.h>
@implementation NSObject (AppInfo)

+ (NSString *)ai_version
{
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

+ (NSInteger)ai_build
{
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return [app_build integerValue];
}

+ (NSString *)ai_identifier
{
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * bundleIdentifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}

+ (NSString *)ai_currentLanguage
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString * currentLanguage = [languages firstObject];
    return [NSString stringWithString:currentLanguage];
}

+ (NSString *)ai_deviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return [NSString stringWithString:deviceString];
}

@end
