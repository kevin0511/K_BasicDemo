//
//  BDDownloadImageManager.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/12.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDDownloadImageManager.h"
#import "SDWebImageDownloader.h"
#import "SDWebImageManager.h"
#import "UIImage+Addition.h"

@implementation BDDownloadImageManager


+ (void)downloadImageWithURL:(NSURL *)URL finishHandle:(void (^)(BOOL finished, UIImage *finishedImage))finishHandle
{
    [self downloadImageWithURL:URL finishHandle:finishHandle progressHandle:nil];
}

+ (void)downloadImageWithURL:(NSURL *)URL finishHandle:(void (^)(BOOL finished, UIImage *finishedImage))finishHandle progressHandle:(void (^)(CGFloat))progressHandle
{
    if (URL == nil) {
        return;
    }
    UIImage * image = [self cacheImageWithURL:URL];
    if (image) {
        if (finishHandle) {
            finishHandle(YES , image);
        }
        if (progressHandle) {
            progressHandle(1.0);
        }
        return;
    }
}

+ (void)downloadImageWithUrl:(NSString *)url finishHandle:(void (^)(BOOL, UIImage *))finishHandle
{
    [self downloadImageWithUrl:url finishHandle:finishHandle progressHandle:nil];
}

+ (void)downloadImageWithUrl:(NSString *)url finishHandle:(void (^)(BOOL finished, UIImage *finishedImage))finishHandle progressHandle:(void (^)(CGFloat))progressHandle
{
    [self downloadImageWithURL:[NSURL URLWithString:url] finishHandle:finishHandle progressHandle:progressHandle];
}


+ (UIImage *)cacheImageWithUrl:(NSString *)url
{
    return [self cacheImageWithURL:[NSURL URLWithString:url]];
}


+ (UIImage *)cacheImageWithURL:(NSURL *)URL
{
    if (URL == nil)
    {
        return nil;
    }
    SDWebImageManager * manager = [SDWebImageManager sharedManager];
    NSString * key = [manager cacheKeyForURL:URL];
    SDImageCache * cache = [SDImageCache sharedImageCache];
    //此方法会先从memory中取
    UIImage * image = [cache imageFromDiskCacheForKey:key];
    return image;
}




@end
