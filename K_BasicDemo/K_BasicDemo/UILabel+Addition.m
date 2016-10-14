//
//  UILabel+Addition.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)

- (instancetype)initWithFont:(UIFont *)font
                   textColor:(UIColor *)textColor
               textAlignment:(NSTextAlignment)textAlignment
{
    if (self = [super init]) {
        self.font = font;
        self.textAlignment = textAlignment ? textAlignment : NSTextAlignmentLeft;
        self.textColor = textColor;
    }
    return self;
}

+ (instancetype)labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment
{
    return [[UILabel alloc] initWithFont:font textColor:textColor textAlignment:textAlignment];
}



@end
