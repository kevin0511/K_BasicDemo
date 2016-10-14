//
//  UIViewController+Addition.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/12.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Addition)

/**
 *  判断是否是正在显示的控制器
 */
- (BOOL)isCurrentAndVisibleViewController;

- (void)pushToNextViewController:(UIViewController *)nextVC;



@end
