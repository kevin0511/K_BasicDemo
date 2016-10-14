//
//  BDShareManager.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/12.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger , BDShareType)
{
    /** QQ  */
    BDShareTypeQQ       =1,
    /** QQ空间*/
    BDShareTypeQZone      ,
    /** 微信会话    */
    BDShareTypeWeChatSession,
    /** 微信朋友圈   */
    BDShareTypeWechat,
    /** 微博*/
    BDShareTypeWeibo
};

@interface BDShareManager : NSObject


+ (instancetype) sharedManager;

- (void)shareWithSharedType:(BDShareType)shareType
                      image:(UIImage *)image
                        url:(NSString *)url
                    content:(NSString *)content
                 controller:(UIViewController *)controller;

- (void)registerAllPlatForms;






@end
