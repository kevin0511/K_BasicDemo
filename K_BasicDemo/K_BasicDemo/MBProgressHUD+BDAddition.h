//
//  MBProgressHUD+BDAddition.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (BDAddition)

+ (void)showError:(NSString *)error
           toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success
             toView:(UIView *)view;

/**
 *  尽量都使用这个
 */
+ (void)showLoading:(UIView *)view;
+ (void)showLoading:(NSString *)text toView:(UIView *)view;


/**
 *  尽量都使用这个
 */
+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)showMessage:(NSString *)message detailMessage:(NSString *)detailMessage toView:(UIView *)view;

+ (void)hideAllHUDsInView:(UIView *)view;

@end
