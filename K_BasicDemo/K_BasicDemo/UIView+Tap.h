//
//  UIView+Tap.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Tap)

/**
 *  动态添加手势
 */
- (void)setTapActionWithBlock:(void(^)(void))block ;

@end
