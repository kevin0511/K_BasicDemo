//
//  UIImage+ImageEffects.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/17.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)
/**
 *  应用光效应
 */
- (UIImage *)applyLightEffect;
/**
 *  应用额外的光线效果
 */
- (UIImage *)applyExtraLightEffect;
/**
 *  应用黑暗效应
 */
- (UIImage *)applyDarkEffect;
/**
 *  应用色彩效果的颜色
 */
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
/**
 *  应用模糊半径为
 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
