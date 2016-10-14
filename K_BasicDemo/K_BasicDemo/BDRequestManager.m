//
//  K_RequestManager.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/10.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDRequestManager.h"

@interface AFHTTPSessionManager(Shared)
//设置为单利
+ (instancetype)sharedManager;
@end

@implementation AFHTTPSessionManager(Shared)

+ (instancetype)sharedManager
{
    static AFHTTPSessionManager * _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [AFHTTPSessionManager manager];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/json",@"text/javascript",@"text/html", nil];
    });
    return _instance;
}

@end

@implementation BDRequestManager

// GET请求
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
responseSeializerType:(BDResponseSeializerType)type
    success:(void (^)(id))success
    failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager sharedManager];
    
    [manager.requestSerializer setValue:[self cookie] forHTTPHeaderField:@"Cookie"];
    
    // 如果不是JSON 或者 不是Default 才设置解析器类型
    if (type != BDResponseSeializerTypeDefault && type != BDResponseSeializerTypeJSON)
    {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    
    // HTTPS 证书设置
    /*
    AFSecurityPolicy * policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    policy.allowInvalidCertificates = YES;
    manager.securityPolicy = policy;
    */
    
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
}


+ (NSString *)cookie
{
    return @"_ga=GA1.2.732729183.1467731127; install_id=5316804410; login_flag=319157cead347271ef233ba429923e3b; qh[360]=1; sessionid=b391787a2cd16be0f914259f0cf829a4; sid_guard=\"b391787a2cd16be0f914259f0cf829a4|1473218826|2591916|Fri\054 07-Oct-2016 03:25:42 GMT\"; sid_tt=b391787a2cd16be0f914259f0cf829a4; uuid=\"w:9ce15113cb34468795d7aff3edddd670";
}

// POST请求
+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
responseSeializerType:(BDResponseSeializerType)type
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager sharedManager];
    
    [manager.requestSerializer setValue:[self cookie] forHTTPHeaderField:@"Authorization"];
    
    if (type != BDResponseSeializerTypeJSON && type != BDResponseSeializerTypeDefault)
    {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    
    //https 证书设置
    AFSecurityPolicy * policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    policy.allowInvalidCertificates = YES;
    manager.securityPolicy = policy;
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

// POST请求 上传数据
+ (void)POST:(NSString *)URLString
  parameters:(id)parameters responseSeializerType:(BDResponseSeializerType)type
constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager sharedManager];
    
    // 请求头
    //    NSString *value = [NSString stringWithFormat:@"Bearer %@",[ CommonTool validStringWithObj:kUserInfo[@"token"]]];
    //    if (value) {
    //        [manager.requestSerializer setValue:value forHTTPHeaderField:@"Authorization"];
    //    }
    
    if (type != BDResponseSeializerTypeJSON && type != BDResponseSeializerTypeDefault)
    {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    // https证书设置
    /*
     AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
     policy.allowInvalidCertificates = YES;
     manager.securityPolicy  = policy;
     */
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
       
        if (block) {
            block(formData);
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
}




/**
 *  设置数据解析器类型
 *  @param manager       请求管理类
 *  @param serilizerType 数据解析器类型
 */
+ (AFHTTPResponseSerializer *)responseSearalizerWithSerilizerType:(BDResponseSeializerType)serilizerType
{
    switch (serilizerType) {
        case BDResponseSeializerTypeDefault:
            return [AFJSONResponseSerializer serializer];
            break;
        
        case BDResponseSeializerTypeJSON:
            return [AFJSONResponseSerializer serializer];
            break;
            
        case BDResponseSeializerTypeXML:
            return [AFXMLParserResponseSerializer serializer];
            break;
            
        case BDResponseSeializerTypePlist:
            return [AFPropertyListResponseSerializer serializer];
            break;
            
        case BDResponseSeializerTypeCompound:
            return [AFCompoundResponseSerializer serializer];
            break;
        
        case BDResponseSeializerTypeImage:
            return [AFImageResponseSerializer serializer];
            break;
        
        case BDResponseSeializerTypeData:
            return [AFHTTPResponseSerializer serializer];
            break;
            
        default:    //默认解析器为 JSON
            return [AFJSONResponseSerializer serializer];
            break;
    }
}


+ (void)cancelAllRequest
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager sharedManager];
    [manager.operationQueue cancelAllOperations];
}


@end
