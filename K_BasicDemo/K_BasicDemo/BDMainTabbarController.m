//
//  K_MainTabbarController.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/9/30.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDMainTabbarController.h"
#import "BDMainNavigationController.h"
#import "BDHomeViewController.h"
#import "BDDiscoverViewController.h"
#import "BDCheckViewController.h"
#import "BDMessageViewController.h"

@interface BDMainTabbarController ()

@end

@implementation BDMainTabbarController

+ (void)initialize
{
    // 设置为不透明
    [[UITabBar appearance] setTranslucent:NO];
    // 设置背景颜色
    [UITabBar appearance].barTintColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    
    // 拿到整个导航控制器的外观
    UITabBarItem * item = [UITabBarItem appearance];
    item.titlePositionAdjustment = UIOffsetMake(0, 1.5);
    
    // 普通状态
    NSMutableDictionary * normalAtts = [NSMutableDictionary dictionary];
    normalAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.62f green:0.62f blue:0.63f alpha:1.00f];
    [item setTitleTextAttributes:normalAtts forState:UIControlStateNormal];
    
    // 选中状态
    NSMutableDictionary *selectAtts = [NSMutableDictionary dictionary];
    selectAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    selectAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    [item setTitleTextAttributes:selectAtts forState:UIControlStateSelected];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self addChildViewControllerWithClassName:[BDHomeViewController description] imageName:@"" title:@"首页"];
    
    [self addChildViewControllerWithClassName:[BDDiscoverViewController description] imageName:@"" title:@"发现"];
    
    [self addChildViewControllerWithClassName:[BDCheckViewController description] imageName:@"" title:@"审核"];
    
    [self addChildViewControllerWithClassName:[BDMessageViewController description] imageName:@"" title:@"消息"];
    
    
}

- (void)addChildViewControllerWithClassName:(NSString *)className
                                  imageName:(NSString *)imageName
                                      title:(NSString *)title {
    
    UIViewController * vc = [[NSClassFromString(className) alloc] init];
    BDMainNavigationController * nav = [[BDMainNavigationController alloc]initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:[imageName stringByAppendingString:@"_press"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
