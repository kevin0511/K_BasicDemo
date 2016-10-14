//
//  UIView+Layer.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)

- (void)setLayerCornerRadius:(CGFloat )cornerRadius
                 borderWidth:(CGFloat )borderWidth
                 borderColor:(UIColor *)borderColor;

/**
 *  边角半径
 */
@property (nonatomic, assign) CGFloat layerCornerRadius;

/**
 *  边线宽度
 */
@property (nonatomic, assign) CGFloat layerBorderWidth;

/**
 *  边线颜色
 */
@property (nonatomic, strong) UIColor *layerBorderColor;

@end
