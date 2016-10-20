//
//  NSObject+AddProperty.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/17.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "NSObject+AddProperty.h"
#import <objc/runtime.h>

//objc_getAssociatedObject 和 objc_setAssociatedObject 都需要制定一个固定的地址,吧这个固定地址值用来表示属性的key,起到一个常量的作用
static const void *StringProperty   = &StringProperty;
static const void *IntegerProperty  = &IntegerProperty;

@implementation NSObject (AddProperty)

@dynamic  stringProperty;

//set
/**
 *  @brief  catgory runtime 实现get set 方法
 */
- (void)setStringProperty:(NSString *)stringProperty
{
    objc_setAssociatedObject(self, StringProperty, stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//get
-(NSString *)stringProperty
{
    return objc_getAssociatedObject(self, StringProperty);
}

@end
