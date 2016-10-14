//
//  UIButton+Addition.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Addition)

/**
 *  快读创建一个UIButton对象 通过给定的图片
 */
+ (instancetype)buttonWithImageName:(NSString *)imageName
                     hightImageName:(NSString *)hightImageName
                        bgImageName:(NSString *)bgImageName
                             target:(id)target
                             action:(SEL)action;

+ (instancetype)buttonWithTitle:(NSString *)title
                    normalColor:(UIColor  *)normalColor
                  selectedColor:(UIColor  *)selectedColor
                       fontSize:(CGFloat)fontSize
                         target:(id)target
                         action:(SEL)action;

+ (instancetype)buttonWithTitle:(NSString *)title
                    normalColor:(UIColor  *)normalColor
                    diableColor:(UIColor  *)diableColor
                       fontSize:(CGFloat)fontSize
                         target:(id)target
                         action:(SEL)action;

+ (instancetype)buttonWithTitle:(NSString *)title
                    normalColor:(UIColor *)normalColor
                  selectedColor:(UIColor *)selectedColor
                       fontSize:(CGFloat)fontSize
                     touchBlock:(void(^)())block;

/**
 *  快速创建一个UIButton对象  通过给定的图片
 */
+ (instancetype)buttonWithImageName:(NSString *)imageName
                     hightImageName:(NSString *)hightImageName
                        bgImageName:(NSString *)bgImageName
                         touchBlock:(void(^)())block;

@end
