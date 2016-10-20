//
//  K_HomeViewController.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/8.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDBaseViewController.h"

@class BDServiceListModel;
@interface BDHomeViewController : BDBaseViewController
@property (nonatomic, strong) NSArray <BDServiceListModel *>*models;
@end
