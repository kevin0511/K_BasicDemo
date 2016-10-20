//
//  NSObject+AppInfo.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/17.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AppInfo)

+ (NSString *)ai_version;
+ (NSInteger )ai_build;
+ (NSString *)ai_identifier;
+ (NSString *)ai_currentLanguage;
+ (NSString *)ai_deviceModel;

@end
