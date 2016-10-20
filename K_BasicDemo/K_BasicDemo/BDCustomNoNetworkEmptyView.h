//
//  BDCustomNoNetworkEmptyView.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/18.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDCustomNoNetworkEmptyView : UIView

/**
 *  没有网络,重试
 */
@property (nonatomic, copy) void(^customNoNetworkEmptyViewDidClickRetryHandle)(BDCustomNoNetworkEmptyView * view);

@end
