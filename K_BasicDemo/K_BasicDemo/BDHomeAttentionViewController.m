//
//  BDHomeAttentionViewController.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/19.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDHomeAttentionViewController.h"
#import "BDHomeAttentionEmptyView.h"
#import "BDBaseRequest.h"

@interface BDHomeAttentionViewController ()
@property (nonatomic, weak) BDHomeAttentionEmptyView * emptyView;
@end

@implementation BDHomeAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BDBaseRequest * request = [BDBaseRequest bd_request];
    request.bd_url = kBDHomeAttentionDynamicListAPI;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
