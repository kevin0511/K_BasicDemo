//
//  UIImage+Cut.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/14.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Cut)

- (UIImage *)clipImageWithScaleWithSize:(CGSize)asize;

- (UIImage *)compressImage;

- (NSData *)compressImageData;

@end
