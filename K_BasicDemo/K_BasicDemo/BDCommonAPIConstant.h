//
//  K_CommonAPIConstant.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/8.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BDCommonAPIConstant : NSObject

#pragma mark - HOME / 首页
/** 内涵动态列表*/
UIKIT_EXTERN NSString *const kBDHomeServiceListAPI;
/** 内涵当前用户关注的用户发布的动态列表*/
UIKIT_EXTERN NSString *const kBDHomeAttentionDynamicListAPI;
/** 内涵某个动态评论列表*/
UIKIT_EXTERN NSString *const kBDHomeDynamicCommentListAPI;
/** 内涵某个分类的动态列表*/
UIKIT_EXTERN NSString *const kBDHomeCategoryDynamicListAPI;
/** 内涵举报动态*/
UIKIT_EXTERN NSString *const kBDHomeReportDynamicAPI;
/** 内涵点赞动态*/
UIKIT_EXTERN NSString *const kBDHomeDynamicLikeAPI;

#pragma mark - DISCOVER / 发现
/** 内涵热吧列表和轮播图*/
UIKIT_EXTERN NSString *const kBDDiscoverHotListAPI;
/** 内涵当前用户订阅的热吧列表*/
UIKIT_EXTERN NSString *const kBDDiscoverSubscribeListAPI;
/** 内涵搜索用户列表*/
UIKIT_EXTERN NSString *const kBDDiscoverSearchUserListAPI;
/** 内涵搜索热吧列表*/
UIKIT_EXTERN NSString *const kBDDiscoverSearchHotDraftListAPI;
/** 内涵搜索动态列表*/
UIKIT_EXTERN NSString *const kBDDiscoverSearchDynamicListAPI;
/** 内涵附近的用户列表*/
UIKIT_EXTERN NSString *const kBDDiscoverNearByUserListAPI;
/** 内涵推荐的用户列表*/
UIKIT_EXTERN NSString *const kBDDiscoverRecommendUserListAPI;

#pragma mark - PUBLISH / 发布
/** 内涵用户发布动态可选择的热吧列表*/
UIKIT_EXTERN NSString *const kBDUserPublishSelectDraftListAPI;
/** 内涵用户发布动态*/
UIKIT_EXTERN NSString *const kBDUserPublishDraftAPI;

#pragma mark - USER / 用户
/** 内涵用户个人信息*/
UIKIT_EXTERN NSString *const kBDUserProfileInfoAPI;
/** 内涵用户的关注用户列表*/
UIKIT_EXTERN NSString *const kBDUserFansListAPI;
/** 内涵用户的粉丝列表*/
UIKIT_EXTERN NSString *const kBDUserAttentionListAPI;
/** 内涵用户的投稿列表*/
UIKIT_EXTERN NSString *const kBDUserPublishDraftListAPI;
/** 内涵用户的收藏列表*/
UIKIT_EXTERN NSString *const kBDUserColDynamicListAPI;
/** 内涵用户的评论列表*/
UIKIT_EXTERN NSString *const kBDUserDynamicCommentListAPI;
/** 内涵用户的黑名单列表*/
UIKIT_EXTERN NSString *const kBDUserBlackUserListAPI;
/** 内涵用户的积分*/
UIKIT_EXTERN NSString *const kBDUserPointAPI;


#pragma mark - CHECK / 审核
/** 内涵审核的动态列表*/
UIKIT_EXTERN NSString *const kBDCheckDynamicListAPI;

@end
