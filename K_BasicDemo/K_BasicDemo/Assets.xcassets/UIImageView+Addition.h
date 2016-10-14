//
//  UIImageView+Addition.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/14.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Addition)

- (instancetype)initWithTarget:(id)target action:(SEL)action;

- (void)addTarget:(id)target action:(SEL)action;

+ (UIImageView *)imageViewWithGIFData:(NSData *)data;

@end
