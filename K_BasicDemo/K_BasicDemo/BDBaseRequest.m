//
//  BDBaseRequest.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/19.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDBaseRequest.h"
#import "BDRequestManager.h"
#import "NSString+Addition.h"
#import "NSNotificationCenter+Addition.h"
#import "NSObject+MJKeyValue.h"
@implementation BDBaseRequest

+ (instancetype)bd_request
{
    return [[self alloc] init];
}

+ (instancetype)bd_requestWithUrl:(NSString *)bd_url
{
    return [self bd_requestWithUrl:bd_url isPost:NO];
}

+ (instancetype)bd_requestWithUrl:(NSString *)bd_url isPost:(BOOL)bd_isPost
{
    return [self bd_requestWithUrl:bd_url isPost:bd_isPost delegated:nil];
}

+ (instancetype)bd_requestWithUrl:(NSString *)bd_url isPost:(BOOL)bd_isPost delegated:(id<BDBaseRequestReponseDelegate>)bd_delegated
{
    BDBaseRequest * request = [self bd_request];
    request.bd_url = bd_url;
    request.bd_isPost = bd_isPost;
    request.bd_delegate = bd_delegated;
    return request;
}

#pragma mark    - 发送请求
- (void)bd_sendRequest
{
    [self bd_sendRequestWithCompletion:nil];
}

- (void)bd_sendRequestWithCompletion:(BDAPIDicCompletion)completion
{
    //链接
    NSString * urlStr = self.bd_url;
    if (urlStr.length == 0) {
        return;
    }
    //参数
    NSDictionary * params = [self params];
    
    //普通POST请求
    if(self.bd_isPost)
    {
        if (self.bd_imageArray.count == 0)
        {
            //开始请求
            [BDRequestManager POST:[urlStr noWhiteSpaceString] parameters:params responseSeializerType:BDResponseSeializerTypeJSON success:^(id responseObject) {
                
                // 处理数据
                [self handleResponse:responseObject completion:completion];
                
            } failure:^(NSError *error) {
                // 数据请求失败,暂时不做处理
            }];
        }
    }
    else    // 普通GET请求
    {
        // 开始请求
        [BDRequestManager GET:[urlStr noWhiteSpaceString] parameters:params responseSeializerType:BDResponseSeializerTypeJSON success:^(id responseObject) {
            
            //处理数据
            [self handleResponse:responseObject completion:completion];
            
        } failure:^(NSError *error) {
            // 数据请求失败,暂时不做处理
        }];
    }
    
    
    //上传图片
    if (self.bd_imageArray.count)
    {
        [BDRequestManager POST:[urlStr noWhiteSpaceString] parameters:params responseSeializerType:BDResponseSeializerTypeJSON constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
           
            NSInteger imgCount = 0;
            for (UIImage * image in self.bd_imageArray)
            {
                NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss:SSS";
                NSString *fileName = [NSString stringWithFormat:@"%@%@.png",[formatter stringFromDate:[NSDate date]],@(imgCount)];
                [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"file" fileName:fileName mimeType:@"image/png"];
                imgCount ++;
            }
            
        } success:^(id responseObject) {
            //处理数据
            [self handleResponse:responseObject completion:completion];
        } failure:^(NSError *error) {
            // 数据请求失败，暂时不做处理
        }];
    }
}


- (void)handleResponse:(id)responseObject completion:(BDAPIDicCompletion)completion
{
     // 接口约定，如果message为 XXX 即重试
    if ([responseObject[@"message"] isEqualToString:@"retry"]) {
        [self bd_sendRequestWithCompletion:completion];
        return  ;
    }
    
    // 数据请求成功回调
    BOOL success = [responseObject[@"message"] isEqualToString:@"success"];
    if (completion) {
        completion(responseObject[@"data"], success, @"");
    } else if (self.bd_delegate) {
        if ([self.bd_delegate respondsToSelector:@selector(requestSuccessReponse:response:message:)]) {
            [self.bd_delegate requestSuccessReponse:success response:responseObject[@"data"] message:@""];
        }
    }
    // 请求成功，发布通知
    [NSNotificationCenter postNotification:kBDRequestSuccessNotification];
    
}


// 设置链接
- (void)setBd_url:(NSString *)bd_url
{
    if (bd_url.length == 0 || [bd_url isKindOfClass:[NSNull class]])
    {
        return;
    }
    _bd_url = bd_url;
}




- (NSDictionary *)params {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"tag"] = @"joke";
    params[@"iid"] = @"5316804410";
    params[@"os_version"] = @"9.3.4";
    params[@"os_api"] = @"18";
    
    params[@"app_name"] = @"joke_essay";
    params[@"channel"] = @"App Store";
    params[@"device_platform"] = @"iphone";
    params[@"idfa"] = @"832E262C-31D7-488A-8856-69600FAABE36";
    params[@"live_sdk_version"] = @"120";
    
    params[@"vid"] = @"4A4CBB9E-ADC3-426B-B562-9FC8173FDA52";
    params[@"openudid"] = @"cbb1d9e8770b26c39fac806b79bf263a50da6666";
    params[@"device_type"] = @"iPhone 6 Plus";
    params[@"version_code"] = @"5.5.0";
    params[@"ac"] = @"WIFI";
    params[@"screen_width"] = @"1242";
    params[@"device_id"] = @"10752255605";
    params[@"aid"] = @"7";
    params[@"count"] = @"50";
    params[@"max_time"] = [NSString stringWithFormat:@"%.2f", [[NSDate date] timeIntervalSince1970]];
    
    [params addEntriesFromDictionary:self.mj_keyValues];
    
    if ([params.allKeys containsObject:@"nh_delegate"]) {
        [params removeObjectForKey:@"nh_delegate"];
    }
    if ([params.allKeys containsObject:@"nh_isPost"]) {
        [params removeObjectForKey:@"nh_isPost"];
    }
    if ([params.allKeys containsObject:@"nh_url"]) {
        [params removeObjectForKey:@"nh_url"];
    }
    if (self.bd_imageArray.count == 0) {
        if ([params.allKeys containsObject:@"nh_imageArray"]) {
            [params removeObjectForKey:@"nh_imageArray"];
        }
    }
    return params;
}
@end
