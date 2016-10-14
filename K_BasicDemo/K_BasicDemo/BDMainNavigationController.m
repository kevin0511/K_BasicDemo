//
//  K_MainNavigationController.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/8.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDMainNavigationController.h"
#import "UIBarButtonItem+Addition.h"

@interface BDMainNavigationController ()

@end

@implementation BDMainNavigationController

+ (void)initialize
{
    //  设置为不透明
    [[UINavigationBar appearance] setTranslucent:NO];
    //  设置导航看背景颜色
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.86f green:0.85f blue:0.80f alpha:1.00f];
    
    //  设置导航栏标题文字颜色
    //  设置字典保存文字大小和颜色
    NSMutableDictionary * color = [NSMutableDictionary dictionary];
    color[NSFontAttributeName] = [UIFont systemFontOfSize:17.0f];
    color[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];;
    [[UINavigationBar appearance] setTitleTextAttributes:color];
    
    
    //  拿到整个导航栏控制器的外观
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    //  设置字典的字体大小
    NSMutableDictionary * atts = [NSMutableDictionary dictionary];
    
    atts[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    atts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        /**
         *  如果在堆栈控制器数量大于1 加返回按钮
         */
        if(self.viewControllers.count > 0)
        {
            UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44,44)];
            [btn setImage:[UIImage imageNamed:@"back_neihan"] forState:UIControlStateNormal];
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 0);
            btn.tintColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
            UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
            [btn addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
            viewController.navigationItem.leftBarButtonItem = leftItem;
        }
        else
        {
            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"" tintColor:[UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f] touchBlock:nil];
        }
    }
    [super pushViewController:viewController animated:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
