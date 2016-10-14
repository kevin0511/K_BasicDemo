//
//  UINavigationItem+BDAddition.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "UINavigationItem+BDAddition.h"

@implementation UINavigationItem (BDAddition)

#if __IPONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1

- (void)setLeftBarButtonItem:(UIBarButtonItem *)_leftBarButtonItem {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        // 此处修改到边界的距离
        negativeSeperator.width = -8;
        
        if (_leftBarButtonItem) {
            [self setLeftBarButtonItems:@[negativeSeperator, _leftBarButtonItem]];
        } else {
            [self setLeftBarButtonItems:@[negativeSeperator]];
        }
    } else {
        [self setLeftBarButtonItem:_leftBarButtonItem animated:NO];
    }
}

#endif

@end
