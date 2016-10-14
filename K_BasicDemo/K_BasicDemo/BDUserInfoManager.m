//
//  BDUserInfoManager.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/10.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDUserInfoManager.h"
#import "BDFileCacheManager.h"

static BDUserInfoManager * _singleton = nil;

@implementation BDUserInfoManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[BDUserInfoManager alloc] init];
    });
    return _singleton;
}

// 当前用户信息
- (BDUserInfoModel *)currentUserInfo
{
    id obj = [BDFileCacheManager getObjectByFileName:NSStringFromClass([BDUserInfoModel class])];
    if (obj != nil) {
        return obj;
    }
    return nil;
}

// 重置用户信息
- (void)resetUserInfoWithUserInfo:(BDUserInfoModel *)userInfo
{
    [userInfo archive];
}

// 登录
- (void)didLoginInWithUserInfo:(id)userInfo
{
    BDUserInfoModel * userinfo = [BDUserInfoModel modelWithDictionary:userInfo];
    [userInfo archive];
    
    [BDFileCacheManager saveUserData:@(YES) forKey:kBDHasLoginFlag];
}

// 退出登录
- (void)didLoginOut
{
    [BDFileCacheManager removeObjectByFileName:NSStringFromClass([BDUserInfoModel class])];
    [BDFileCacheManager saveUserData:@(NO) forKey:kBDHasLoginFlag];
}

//  判断是否登录状态
- (BOOL)isLogin
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kBDHasLoginFlag];
}

@end
