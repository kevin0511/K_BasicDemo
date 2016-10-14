//
//  BDUserInfoManager.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/10.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BDUserInfoModel.h"

@interface BDUserInfoManager : NSObject


+ (instancetype)sharedManager;
/**
 *  登录成功
 */
- (void)didLoginInWithUserInfo:(id)userInfo;
/**
 *  退出
 */
- (void)didLoginOut;
/**
 *  获取用户信息
 */
- (BDUserInfoModel *)currentUserInfo;
/**
 *  更新缓存中的用户信息
 */
- (void)resetUserInfoWithUserInfo:(BDUserInfoModel *)userInfo;

/**
 *  用来记录是否是登陆状态
 */
@property (nonatomic, assign) BOOL isLogin;







@end
