//
//  NSNotificationCenter+Addition.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/14.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (Addition)


/**
 *  只发送一个通知
 */
+ (void)postNotification:(NSString *)notiName;


/**
 *  发送一个通知
 *
 *  @param notiName 通知名字
 *  @param object   通知内容
 */
+ (void)postNotification:(NSString *)notiName object:(id)object;

/**
 *  移除所有通知的注册者
 */
+ (void)removeAllObserverForObj:(id)obj;


/**
 *  注册一个通知
 */
+ (void)addObserver:(id)observer action:(SEL)action name:(NSString *)name;



@end
