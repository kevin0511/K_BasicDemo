//
//  K_RequestManager.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/10.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSUInteger , BDResponseSeializerType)
{
    /**
     *  默认类型 JSON  如果使用这个响应解析器类型,那么请求返回的数据将会是JSON格式
     */
    BDResponseSeializerTypeDefault,
    /**
     *  JSON类型 如果使用这个响应解析器类型,那么请求返回的数据将会是JSON格式
     */
    BDResponseSeializerTypeJSON,
    /*
     *  XML类型 如果使用这个响应解析器类型,那么请求返回的数据将会是XML格式
     */
    BDResponseSeializerTypeXML,
    /**
     *  Plist类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Plist格式
     */
    BDResponseSeializerTypePlist,
    /*
     *  Compound类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Compound格式
     */
    BDResponseSeializerTypeCompound,
    /**
     *  Image类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Image格式
     */
    BDResponseSeializerTypeImage,
    /**
     *  Data类型 如果使用这个响应解析器类型,那么请求返回的数据将会是二进制格式
     */
    BDResponseSeializerTypeData
};


@interface BDRequestManager : NSObject

/**
 *  GET请求 By NSURLSession
 *
 *  @param URLString  URL
 *  @param parameters 参数
 *  @param type       数据解析器类型
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)URLString parameters:(id)parameters responseSeializerType:(BDResponseSeializerType)type success:(void(^)(id responseObject))success failure:(void(^)(NSError * error))failure;


/**
 *  POST请求 By NSURLSession
 *
 *  @param URLString  URL
 *  @param parameters 参数
 *  @param type       数据解析器类型
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(BDResponseSeializerType)type success:(void(^)(id responseObject))success failure:(void(^)(NSError * error))failure;


/**
 *  POST请求 上传数据 By NSURLSession
 *
 *  @param URLString  URL
 *  @param parameters 参数
 *  @param type       数据解析器类型
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(BDResponseSeializerType)type constructingBodyWithBlock:(void(^)(id<AFMultipartFormData> formData))block success:(void (^)(id responseObject))success failure:(void (^)(NSError * error))failure;


+ (void)cancelAllRequest;



@end
