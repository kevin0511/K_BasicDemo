//
//  UIImage+Cut.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/14.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "UIImage+Cut.h"

@implementation UIImage (Cut)


- (UIImage *)clipImageWithScaleWithSize:(CGSize)asize
{
    UIImage * newImage;
    UIImage * image = self;
    if (nil == image) {
        newImage = nil;
    }
    else
    {
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.width;
            rect.size.height = asize.width * oldsize.height / oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        else
        {
            rect.size.width = asize.height * oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextClipToRect(context, CGRectMake(0, 0, asize.width, asize.height));
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height)); //clear background
        [image drawInRect:rect];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndPDFContext();
    }
    return newImage;
}


- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize
{
    CGFloat compression = 0.9;
    CGFloat maxCompression = 0.1f;
    NSData * imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    UIImage * compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

- (NSData *)compressImageData
{
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData * imageDate = UIImageJPEGRepresentation(self, compression);
    while (([imageDate length] > 0.1*1024*1024) && (compression >= maxCompression)) {
        compression -= 0.05;
        imageDate = UIImageJPEGRepresentation(self, compression);
    }
    return imageDate;
}


- (UIImage *)compressImage
{
    NSData * imageData = [self compressImageData];
    UIImage * compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}









@end
