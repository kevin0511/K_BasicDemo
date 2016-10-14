//
//  UIBarButtonItem+Addition.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/8.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Addition)

/**
 *  快速创建一个UIBarButtonItem对象 通过给定的图片
 */
+ (instancetype)itemWithImageName:(NSString *)imageName hightImageName:(NSString *)hightImageName target:(id)target action:(SEL)action;

/**
 *  快速创建一个UIBarButtonItem对象 通过给定的图片
 */
+ (instancetype)itemWithImageName:(NSString *)imageName heightImageName:(NSString *)hightImageName touchBlock:(void(^)())block;


/**
 *  快速创建一个UIBarButtonItem对象 通过给定的标题和tintColor
 */
+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor;

/**
 *  快速创建一个UIBarButtonItem对象 通过给定的标题和tintColor
 */
+ (instancetype)itemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor touchBlock:(void(^)())block;


@end
