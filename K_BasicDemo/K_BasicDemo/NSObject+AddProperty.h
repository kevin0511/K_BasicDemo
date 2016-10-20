//
//  NSObject+AddProperty.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/17.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AddProperty)

/**
 *  @brief  catgory runtime实现get set 方法增加一个字符串属性
 */
@property (nonatomic,strong) NSString *stringProperty;

/**
 *  @brief catgory  runtime实现get set 方法增加一个NSInteger属性
 */
@property (nonatomic,assign) NSInteger integerProperty;


@end
