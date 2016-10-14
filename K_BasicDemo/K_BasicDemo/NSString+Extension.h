//
//  NSString+Extension.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/14.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

#pragma mark    - java api
- (NSUInteger)compareTo:(NSString *)comp;
- (NSUInteger)compareToIgnoreCase:(NSString *)comp;

- (bool)contains:(NSString *)subString;
- (bool)endsWith:(NSString *)subString;
- (bool)startsWith:(NSString *)subString;

- (NSUInteger)indexOf:(NSString *)subString;
- (NSUInteger)indexOf:(NSString *)subString startingFrom:(NSUInteger) index;
- (NSUInteger)lastIndexOf:(NSString *)subString;
- (NSUInteger)lastIndexOf:(NSString *)subString startingFrom:(NSUInteger) index;

- (NSString *)subStringFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;
- (NSString *)trim;
- (NSArray *)split:(NSString *)token;
- (NSString *)replace:(NSString *)target withString:(NSString *)replacement;
- (NSArray *)split:(NSString *)token limit:(NSUInteger) maxResults;

- (CGSize)sizeWithConstrainedToWidth:(float)width fromFont:(UIFont *)font1 lineSpace:(float)lineSpace;
- (CGSize)sizeWithConstrainedToSize:(CGSize)size fromFont:(UIFont *)font1 lineSpace:(float)lineSpace;

- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height andWidth:(float)width;
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height;



@end
