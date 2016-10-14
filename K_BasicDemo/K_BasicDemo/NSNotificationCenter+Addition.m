//
//  NSNotificationCenter+Addition.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/14.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "NSNotificationCenter+Addition.h"

@implementation NSNotificationCenter (Addition)

+ (void)postNotification:(NSString *)notiName
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notiName object:nil];
}

+ (void)postNotification:(NSString *)notiName object:(id)object
{
    if (object == nil) {
        [self postNotification:notiName];
    }else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:notiName object:object userInfo:nil];
    }
}

+ (void)removeAllObserverForObj:(id)obj
{
    [[NSNotificationCenter defaultCenter]removeObserver:obj];
}

+ (void)addObserver:(id)observer action:(SEL)action name:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:action name:name object:nil];
}

@end
