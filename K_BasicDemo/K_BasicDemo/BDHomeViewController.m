//
//  K_HomeViewController.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/8.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDHomeViewController.h"
#import "BDCustomNoNetworkEmptyView.h"
#import "BDCustomSlideViewController.h"
#import "BDHomeAttentionViewController.h"
@interface BDHomeViewController ()
<
BDCustomSlideViewControllerDelegate,
BDCustomSlideViewControllerDataSource
>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) BDCustomSlideViewController * slideViewController;
@property (nonatomic, weak) BDHomeAttentionViewController * attentionController;
@end

@implementation BDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}



@end
