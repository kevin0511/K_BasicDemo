//
//  BDHomeAttentionEmptyView.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/19.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDHomeAttentionEmptyView : UIView

/**
 *  点我找朋友
 */
@property (nonatomic, copy) void(^homeAttentionEmptyViewFindFriendHandle)();
@end
