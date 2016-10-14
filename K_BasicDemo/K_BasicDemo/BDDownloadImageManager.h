//
//  BDDownloadImageManager.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/12.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDDownloadImageManager : NSObject

+ (void)downloadImageWithURL:(NSURL *)URL finishHandle:(void(^)(BOOL finish , UIImage * finishedImage))finishHandle;

+ (void)downloadImageWithURL:(NSURL *)URL finishHandle:(void(^)(BOOL finish , UIImage * finishedImage))finishHandle progressHandle:(void(^)(CGFloat progress))progressHandle;


+ (void)downloadImageWithUrl:(NSString *)url finishHandle:(void(^)(BOOL finished , UIImage *finishedImage))finishHandle;

+ (void)downloadImageWithUrl:(NSString *)URL finishHandle:(void(^)(BOOL finish , UIImage * finishedImage))finishHandle progressHandle:(void(^)(CGFloat progress))progressHandle;

+ (UIImage *)cacheImageWithUrl:(NSString *)url;

+ (UIImage *)cacheImageWithURL:(NSURL *)URL;

@end
