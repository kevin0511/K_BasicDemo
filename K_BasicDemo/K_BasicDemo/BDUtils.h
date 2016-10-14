//
//  BDUtils.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/10.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^BDRefreshAndLoadMoreHandle)(void);
@interface BDUtils : NSObject


/**  开始下拉刷新 */
+ (void)beginPullRefreshForScrollView:(UIScrollView *)scrollView;

/** 判断头部是否在刷新   */
+ (BOOL)headerIsRefreshForScrollView:(UIScrollView *)scrollView;

/** 判断尾部是否在刷新*/
+ (BOOL)footerIsLoadingForScrollView:(UIScrollView *)scrollView;

/** 提示没有更多数据的情况*/
+ (void)noticeNoMoreDataForScrollView:(UIScrollView *)scrollView;

/** 重置footer    */
+ (void)resetNoMoreDataForScrollView:(UIScrollView *)scrollView;

/** 停止下拉刷新*/
+ (void)endRefreshForScrollView:(UIScrollView *)scrollView;

/** 停止上拉加载*/
+ (void)endLoadMoreForScrollView:(UIScrollView *)scrollView;

/** 隐藏footer*/
+ (void)hiddenFooterForScrollView:(UIScrollView *)scrollView;

/** 隐藏header*/
+ (void)hiddenHeaderForScrollView:(UIScrollView *)scrollView;

/** 下拉刷新*/
+ (void)addLoadMoreForScrollView:(UIScrollView *)scrollView loadMoreCallBack:(BDRefreshAndLoadMoreHandle)loadMoreCallBackBlock;

/** 上拉加载*/
+ (void)addPullRefreshForScrollView:(UIScrollView *)scrollView pullRefreshCllBack:(BDRefreshAndLoadMoreHandle)pullRefreshCallBackBlock;


/**
 *  转换时间    时间戳转时间
 */

+ (NSString *)dateStrFromDate:(NSDate *)date withDateFormat:(NSString *)format;



/**
 *  转化时间
 *  几天前   几分钟前
 */
+ (NSString *)updateTimeForTimeInterval:(NSInteger)timeInterval;

/**
 *  公共富文本
 */
+ (NSAttributedString *)attStringWithString:(NSString *)string keyWord:(NSString *)keyWord;

+ (NSAttributedString *)attStringWithString:(NSString *)string
                                    keyWord:(NSString *)keyWord
                                       font:(UIFont   *)font
                           highLightedColor:(UIColor  *)highLightedColor
                                  textColor:(UIColor  *)textColor;

+ (NSAttributedString *)attStringWithString:(NSString *)string
                                    keyWord:(NSString *)keyWord
                                       font:(UIFont   *)font
                           highLightedColor:(UIColor  *)highLightedColor
                                  textColor:(UIColor  *)textColor
                                  lineSpace:(CGFloat   )lineSpace;

+ (NSString *)validString:(NSString *)string;



/**
 *  判断字符串是否为空
 */

+ (BOOL)isBlandString:(NSString *)string;

/** 是否是当前用户 */
+ (BOOL)isCurrentUserWithUserId:(NSInteger)userId;

/** color生成image */
+ (UIImage *)imageWithColor:(UIColor *)color;


@end
