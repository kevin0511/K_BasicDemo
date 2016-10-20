//
//  NSObject+AutoCoding.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/17.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AutoCoding)<NSSecureCoding>

//coding
+ (NSDictionary *)codableProperties;
- (void)setWithCoder:(NSCoder *)aDecoder;
//property access
- (NSDictionary *)codableProperties;
- (NSDictionary *)dictionaryRepresentation;
//loading / saving
+ (instancetype)objectWithContentsOfFile:(NSString *)path;
- (BOOL)writeToFile:(NSString *)filePath atomically:(BOOL)useAuxiliaryFile;

@end
