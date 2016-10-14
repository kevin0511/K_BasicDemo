//
//  BDAnimationManager.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/12.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDAnimationManager : NSObject

/** 为某个视图添加*/
+ (void)addTransformAnimationForView:(UIView *)view;

/**
 *  让某个视图抖动
 *  @param  viewToShake 需要抖动的视图
 */
+ (void)shakeView:(UIView *)viewToShake;

@end
