//
//  UIViewController+Addition.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/12.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "UIViewController+Addition.h"

@implementation UIViewController (Addition)

- (BOOL)isCurrentAndVisibleViewController
{
    return self.isViewLoaded && self.view.window;
}

- (void)pushToNextViewController:(UIViewController *)nextVC
{
    self.navigationController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
