//
//  NSString+Addition.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

- (NSString *)convertTimesTampWithDateFormat:(NSString *)dateFormat;

- (NSString *)contractionsImageViewUrl;

/**
 *  无空格和换行的字符串
 */
- (NSString *)noWhiteSpaceString;

/**
 *  计算字体大小和换行需要最大换行距离
 */
- (CGSize)sizeWithText:(UIFont *)font maxW:(CGFloat)maxW;

/**
 *  计算字体大小和换行
 */
- (CGSize)sizeWithText:(UIFont *)font;

/**
 *  计算当前文件\文件夹的内容大小
 */
- (NSInteger)fileSize;

/**
 *  判断手机号
 */
- (BOOL)isPhoneNumber;

/**
 *  验证手机号
 */
- (BOOL)isValidateMobile:(NSString *)mobileNum;
/**
 *  判断邮箱
 */
- (BOOL)isEmailWithString:(NSString *)str;

- (BOOL)isGloabelNumberWithString:(NSString *)str;


/**
 *  返回处理过的字符串, 只保留小数点后两位, 结尾0省略
 */
- (instancetype)dealedPriceString;

/**
 *  判断中文和英文字符的长度
 */
- (int)convertToInt:(NSString *)strTemp;

@end
