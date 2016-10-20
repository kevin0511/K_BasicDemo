//
//  BDCustomCommonEmptyView.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/19.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDCustomCommonEmptyView : UIView

@property (nonatomic, weak) UIImageView * topTipImageView;
@property (nonatomic, weak) UILabel * firstL;
@property (nonatomic, weak) UILabel * secondL;

- (instancetype)initWithTitle:(NSString *)title
                  secondTitle:(NSString *)secondTitle
                     iconName:(NSString *)iconName;

- (instancetype)initWithAttributedTitle:(NSMutableAttributedString *)attributedTitle
                  secondAttributedTitle:(NSMutableAttributedString *)secondAttributedTitle
                               iconName:(NSString *)iconName;

- (void)showInView:(UIView *)view;

@end
