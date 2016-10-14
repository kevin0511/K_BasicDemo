//
//  NSString+Encrypt.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)

/**
 *  字符串md5加密
 */
- (NSString *)stringWithMD5;

/**
 *  字符串sha1加密
 */
- (NSString *)stringWithSha1;

@end
