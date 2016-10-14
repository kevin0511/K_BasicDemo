//
//  UIButton+Addition.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/13.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "UIButton+Addition.h"
#import <objc/runtime.h>

typedef void(^ActionBlock)();

@implementation UIButton (Addition)

static char buttonBlockKey;

+ (instancetype)buttonWithImageName:(NSString *)imageName
                     hightImageName:(NSString *)hightImageName
                        bgImageName:(NSString *)bgImageName
                             target:(id)target
                             action:(SEL)action
{
    UIButton * button = [[UIButton alloc] init];
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (hightImageName) {
        [button setImage:[UIImage imageNamed:hightImageName] forState:UIControlStateNormal];
    }
    
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.contentMode = UIViewContentModeCenter;
    return button;
}

+ (instancetype)buttonWithImageName:(NSString *)imageName
                     hightImageName:(NSString *)hightImageName
                        bgImageName:(NSString *)bgImageName
                         touchBlock:(void (^)())block
{
    UIButton * button = [self buttonWithImageName:imageName hightImageName:hightImageName bgImageName:bgImageName target:self action:@selector(btnTouch:)];
    button.block = block;
    return button;
}

+ (void)btnTouch:(UIButton *)button
{
    if (button.block) {
        button.block();
    }
}


+ (instancetype)buttonWithTitle:(NSString *)title
                    normalColor:(UIColor *)normalColor
                  selectedColor:(UIColor *)selectedColor
                       fontSize:(CGFloat)fontSize
                     touchBlock:(void (^)())block
{
    UIButton * button = [self buttonWithTitle:title
                                  normalColor:normalColor
                                selectedColor:selectedColor
                                     fontSize:fontSize
                                       target:self
                                       action:@selector(btnTouch:)];
    button.block = block;
    return button;
}

+ (instancetype)buttonWithTitle:(NSString *)title
                    normalColor:(UIColor *)normalColor
                    diableColor:(UIColor *)diableColor
                       fontSize:(CGFloat)fontSize
                         target:(id)target
                         action:(SEL)action
{
    UIButton * button = [[UIButton alloc] init];
    if (target && action)
    {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (normalColor && title)
    {
        [button setTitleColor:normalColor forState:UIControlStateNormal];
    }
    if (diableColor && title)
    {
        [button setTitleColor:diableColor forState:UIControlStateDisabled];
    }
    
    button.titleLabel.font = kFont(fontSize);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.contentMode = UIViewContentModeCenter;
    
    return button;
}


+ (instancetype)buttonWithTitle:(NSString *)title
                    normalColor:(UIColor *)normalColor
                  selectedColor:(UIColor *)selectedColor
                       fontSize:(CGFloat)fontSize
                         target:(id)target
                         action:(SEL)action
{
    UIButton * button = [[UIButton alloc] init];
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (normalColor && title) {
        [button setTitleColor:normalColor forState:UIControlStateNormal];
    }
    if (selectedColor && title) {
        [button setTitleColor:selectedColor forState:UIControlStateSelected];
    }
    button.titleLabel.font = kFont(fontSize);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.contentMode = UIViewContentModeCenter;
    
    return button;
}


- (void)setBlock:(ActionBlock)block
{
    objc_setAssociatedObject(self, &buttonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ActionBlock)block
{
    return objc_getAssociatedObject(self, &buttonBlockKey);
}

@end
