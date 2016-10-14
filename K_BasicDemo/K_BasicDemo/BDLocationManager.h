//
//  BDLocationManager.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/11.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLLocation;

typedef void(^BDLocationManagerDidUpdateLocationHandle)(CLLocation *newLocation, NSString *newLatitude, NSString *newLongitude);

@interface BDLocationManager : NSObject

/** 开始定位*/
- (void)startSerialLocation;

+ (instancetype)sharedManager;

/** 更新定位回调*/
- (void)setUpLocationManagerUploadLocationHandle:(BDLocationManagerDidUpdateLocationHandle)updateLocationHandle;

/** 是否苦役定位*/
@property (nonatomic ,assign) BOOL canLocationFlag;

/** 是否有经纬度*/
@property (nonatomic ,assign) BOOL hasLocation;


@end
