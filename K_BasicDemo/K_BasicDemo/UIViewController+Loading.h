//
//  UIViewController+Loading.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/12.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Loading)

- (UIView *)loadingView;

- (void)showLoadingViewWithFrame:(CGRect)frame;

- (void)showLoadingView;

- (void)hideLoadingView;

@end
