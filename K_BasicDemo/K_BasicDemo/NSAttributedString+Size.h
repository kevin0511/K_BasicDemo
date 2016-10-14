//
//  NSAttributedString+Size.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Size)

/**
 *  根据约束的宽度来求NSAttributedString的高度
 */
- (CGFloat)heightWithConstrainedWidth:(CGFloat)width;

@end
