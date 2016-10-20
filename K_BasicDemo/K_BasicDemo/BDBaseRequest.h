//
//  BDBaseRequest.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/19.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol BDBaseRequestReponseDelegate <NSObject>
@required
/**
 *  如果不用block返回数据的话  这个方法必须实现
 */
- (void)requestSuccessReponse:(BOOL)success
                     response:(id)response
                      message:(NSString *)message;
@end

typedef void(^BDAPIDicCompletion)(id response, BOOL success , NSString * message);

@interface BDBaseRequest : NSObject

@property (nonatomic, weak) id <BDBaseRequestReponseDelegate> bd_delegate;
/** 链接 */
@property (nonatomic, copy) NSString * bd_url;
/** 默认GET*/
@property (nonatomic, assign) BOOL bd_isPost;
/** 图片数组*/
@property (nonatomic, strong) NSArray <UIImage *>* bd_imageArray;

/**
 *  构造方法
 */
+ (instancetype)bd_request;
+ (instancetype)bd_requestWithUrl:(NSString *)bd_url;
+ (instancetype)bd_requestWithUrl:(NSString *)bd_url isPost:(BOOL)bd_isPost;
+ (instancetype)bd_requestWithUrl:(NSString *)bd_url isPost:(BOOL)bd_isPost
                        delegated:(id<BDBaseRequestReponseDelegate>)bd_delegated;

/** 开始请求，如果设置了代理，不需要block回调*/
- (void)bd_sendRequest;
/** 开始请求，没有设置代理，或者设置了代理，需要block回调，block回调优先级高于代理*/
- (void)bd_sendRequestWithCompletion:(BDAPIDicCompletion)completion;


@end
