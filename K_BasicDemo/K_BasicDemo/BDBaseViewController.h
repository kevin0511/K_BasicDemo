//
//  BDBaseViewController.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/18.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BDBaseViewControllerHandle)();

@interface BDBaseViewController : UIViewController

- (void)pop;

- (void)popToRootVC;

- (void)popToVC:(UIViewController *)vc;

- (void)dismiss;

- (void)dismissWithCompletion:(void(^)())completion;

- (void)presentVC:(UIViewController *)vc;

- (void)presentVC:(UIViewController *)vc completion:(void(^)(void))completion;

- (void)pushVC:(UIViewController *)vc;

- (void)removeChildVC:(UIViewController *)childVC;

- (void)addChildVC:(UIViewController *)childVC;

/**
 *  加载中
 */
- (void)showLoadingAnimation;

/**
 *  停止加载
 */
- (void)hideLoadingAnimation;

/**
 *  请求数据,交给子类去实现
 */
- (void)loadData;

@property (nonatomic, assign) BOOL isNetWorkReachable;
@end
