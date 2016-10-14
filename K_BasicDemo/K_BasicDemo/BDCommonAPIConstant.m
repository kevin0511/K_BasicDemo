//
//  K_CommonAPIConstant.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/8.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDCommonAPIConstant.h"

@implementation BDCommonAPIConstant


#pragma mark - HOME / 首页
/** 内涵动态列表*/
NSString *const kBDHomeServiceListAPI = @"http://lf.snssdk.com/neihan/service/tabs";;
/** 内涵当前用户关注的用户发布的动态列表*/
NSString *const kBDHomeAttentionDynamicListAPI = @"http://lf.snssdk.com/neihan/dongtai/dongtai_list/v1/";
/** 内涵某个动态评论列表*/
NSString *const kBDHomeDynamicCommentListAPI = @"http://isub.snssdk.com/neihan/comments/";
/** 内涵某个分类的动态列表*/
NSString *const kBDHomeCategoryDynamicListAPI = @"http://lf.snssdk.com/neihan/stream/category/data/v2/";
/** 内涵举报动态*/
NSString *const kBDHomeReportDynamicAPI = @"http://lf.snssdk.com/feedback/2/report";
/** 内涵点赞动态*/
NSString *const kBDHomeDynamicLikeAPI = @"http://isub.snssdk.com/2/data/item_action/";

#pragma mark - DISCOVER / 发现
/** 内涵热吧列表和轮播图*/
NSString *const kBDDiscoverHotListAPI = @"http://lf.snssdk.com/2/essay/discovery/v3/";
/** 内涵当前用户订阅的热吧列表*/
NSString *const kBDDiscoverSubscribeListAPI = @"http://i.snssdk.com/api/2/essay/zone/subscribe_categories/";
/** 内涵搜索用户列表*/
NSString *const kBDDiscoverSearchUserListAPI = @"http://lf.snssdk.com/api/2/essay/user/search/";
/** 内涵搜索热吧列表*/
NSString *const kBDDiscoverSearchHotDraftListAPI = @"http://lf.snssdk.com/api/2/essay/category/search/";
/** 内涵搜索动态列表*/
NSString *const kBDDiscoverSearchDynamicListAPI = @"http://lf.snssdk.com/api/2/essay/content/search_all/";
/** 内涵附近的用户列表*/
NSString *const kBDDiscoverNearByUserListAPI = @"http://lf.snssdk.com/neihan/user/nearby/v1/";
/** 内涵推荐的用户列表*/
NSString *const kBDDiscoverRecommendUserListAPI = @"http://lf.snssdk.com/neihan/user_relation/recommend_list/v1/";;

#pragma mark - PUBLISH / 发布
/** 内涵用户发布动态可选择的热吧列表*/
NSString *const kBDUserPublishSelectDraftListAPI = @"http://lf.snssdk.com/neihan/category/post_list";;
/** 内涵用户发布动态*/
NSString *const kBDUserPublishDraftAPI = @"http://lf.snssdk.com/2/essay/zone/ugc/post/v2/";

#pragma mark - USER / 用户
/** 内涵用户个人信息*/
NSString *const kBDUserProfileInfoAPI = @" http://isub.snssdk.com/neihan/user/profile/v2/";;
/** 内涵用户的关注用户列表*/
NSString *const kBDUserFansListAPI = @"http://lf.snssdk.com/neihan/user_relation/get_following/v1/";;
/** 内涵用户的粉丝列表*/
NSString *const kBDUserAttentionListAPI = @"http://lf.snssdk.com/neihan/user_relation/get_followed/v1/";;
/** 内涵用户的投稿列表*/
NSString *const kBDUserPublishDraftListAPI = @"http://lf.snssdk.com/2/essay/zone/user/posts/";;
/** 内涵用户的收藏列表*/
NSString *const kBDUserColDynamicListAPI = @"http://lf.snssdk.com/neihan/user/favorites/v2/";
/** 内涵用户的评论列表*/
NSString *const kBDUserDynamicCommentListAPI = @"http://isub.snssdk.com/neihan/user/comments/v2/";
/** 内涵用户的黑名单列表*/
NSString *const kBDUserBlackUserListAPI = @"http://lf.snssdk.com/neihan/user_relation/get_blocking/v1";
/** 内涵用户的积分*/
NSString *const kBDUserPointAPI;


#pragma mark - CHECK / 审核
/** 内涵审核的动态列表*/
NSString *const kBDCheckDynamicListAPI = @"http://lf.snssdk.com/2/essay/zone/ugc/recent/v1/";;



@end
