//
//  BDShareManager.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/12.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDShareManager.h"

#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "WXApi.h"
#import "WeiboSDK.h"
#import <TencentOpenAPI/TencentApiInterface.h>

static BDShareManager * _singleton = nil;

@implementation BDShareManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[self alloc] init];
    });
    return _singleton;
}

//注册微信  微博 QQ
- (void)registerAllPlatForms
{
    [UMSocialData setAppKey:@"57cfeda567e58e275c00102d"];
    //设置微信appid,appSecret,分享url
    [UMSocialData openLog:YES];
    [UMSocialWechatHandler setWXAppId:@"wxc01464912319f82e" appSecret:@"a899820621ce623d835c4caf9381762d" url:@"http://www.jianshu.com/users/3930920b505b/latest_articles"];
    //设置手机QQ 的AppId ,Appkey, 和分享URL ,需要#import "UMSocialQQHandler.h"
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.jianshu.com/users/3930920b505b/latest_articles"];
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。需要 #import "UMSocialSinaSSOHandler.h"
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
                                              secret:@"04b48b094faeb16683c32669824ebdad"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}


- (void)shareWithSharedType:(BDShareType)shareType
                      image:(UIImage *)image
                        url:(NSString *)url
                    content:(NSString *)content
                 controller:(UIViewController *)controller
{
    switch (shareType) {
        case BDShareTypeWeChatSession:
        {
            if (![WXApi isWXAppInstalled]) {
                //微信没有安装,请先安装微信
                return;
            }
            
            UMSocialUrlResource * resource = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:@""];
            [[UMSocialDataService defaultDataService] postSNSWithTypes:@[UMShareToWechatSession] content:content image:[UIImage imageNamed:@""] location:nil urlResource:resource presentedController:controller completion:^(UMSocialResponseEntity *response) {
               
                if (response.responseCode == UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享成功!");
                }
            }];
        }
        break;
        
       case BDShareTypeWechat:
        {
            if (![WXApi isWXAppInstalled]) {
                return;
            }
            [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeImage;
            UMSocialUrlResource * resource = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:url];
            [[UMSocialDataService defaultDataService] postSNSWithTypes:@[UMShareToWechatTimeline] content:content image:image location:nil urlResource:resource presentedController:controller completion:^(UMSocialResponseEntity *response) {
                if (response.responseCode == UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享成功!");
                }
            }];
        }
        break;
        
        case BDShareTypeWeibo:
        {
            if (![WeiboSDK isWeiboAppInstalled]) {
                //微博没有安装
                return;
            }
            UMSocialUrlResource * resource = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:url];
            [[UMSocialDataService defaultDataService] postSNSWithTypes:@[UMShareToSina] content:content image:image location:nil urlResource:resource presentedController:controller completion:^(UMSocialResponseEntity *response) {
               
                if (response.responseCode == UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享成功!");
                }
            }];
        }
        break;
        
        case BDShareTypeQQ:
        {
            if (![TencentApiInterface isTencentAppInstall:kIphoneQQ]) {
                //没有安装QQ
                return;
            }
            [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeImage;
            UMSocialUrlResource * resource = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:url];
            [[UMSocialDataService defaultDataService] postSNSWithTypes:@[UMShareToQQ] content:content image:image location:nil urlResource:resource presentedController:controller completion:^(UMSocialResponseEntity *response) {
                if (response.responseCode == UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享成功！");
                }
            }];
        }
        break;
            
        case BDShareTypeQZone:
        {
            if (![TencentApiInterface isTencentAppInstall:kIphoneQQ])
            {
                return;
            }
            [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeImage;
            UMSocialUrlResource * resource = [[UMSocialUrlResource alloc]initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:url];
            [[UMSocialDataService defaultDataService]postSNSWithTypes:@[UMShareToQzone] content:content image:image location:nil urlResource:resource presentedController:controller completion:^(UMSocialResponseEntity *response) {
               
                if (response.responseCode == UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享成功！");
                }
            }];
        }
        break;
            
        default:
            break;
    }
    image = nil;
}

- (void)shareSucceed {
    
}

@end
