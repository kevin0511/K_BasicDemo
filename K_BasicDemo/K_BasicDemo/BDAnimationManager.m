//
//  BDAnimationManager.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/12.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDAnimationManager.h"

@implementation BDAnimationManager


+ (void)addTransformAnimationForView:(UIView *)view
{
    view.transform = CGAffineTransformMakeScale(0.97, 0.97);
    [UIView animateWithDuration:0.12 animations:^{
        view.transform = CGAffineTransformIdentity;
        view.alpha = 1.0f;
    }completion:^(BOOL finished) {
        
    }];
}

/**
 *  抖动视图
 */
+ (void)shakeView:(UIView *)viewToShake
{
    CGFloat t = 4.0;
    CGAffineTransform translateRight = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft  = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    viewToShake.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
       
        [UIView setAnimationRepeatCount:2.0];
        viewToShake.transform = translateRight;
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                viewToShake.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
        
    }];
}



@end
