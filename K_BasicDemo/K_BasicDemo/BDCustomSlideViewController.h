//
//  BDCustomSlideViewController.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/19.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDCustomSlideViewController;
@protocol BDCustomSlideViewControllerDelegate <NSObject>

/**
 *  滚动偏移量
 */
- (void)customSlideViewController:(BDCustomSlideViewController *)slideViewController
                      slideOffset:(CGPoint)slideOffset;

- (void)customSlideViewController:(BDCustomSlideViewController *)slideViewController
                       slideIndex:(NSInteger)slideIndex;

@end

@protocol BDCustomSlideViewControllerDataSource <NSObject>

/**
 *  子控制器
 */
- (UIViewController *)slideViewController:(BDCustomSlideViewController *)slideViewController
                    viewControllerAtIndex:(NSInteger)index;
/**
 *  子控制器数量
 */
- (NSInteger)numberOfChildViewControllersInSlideViewController:(BDCustomSlideViewController *)
    slideViewController;
@end

@interface BDCustomSlideViewController : UIViewController
@property (nonatomic, weak) id <BDCustomSlideViewControllerDelegate>delegate;
@property (nonatomic, weak) id <BDCustomSlideViewControllerDataSource>dataSource;
@property (nonatomic, assign) NSInteger selectedIndex;
- (void)reloadData;
@end
