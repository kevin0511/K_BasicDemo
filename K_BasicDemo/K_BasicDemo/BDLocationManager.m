//
//  BDLocationManager.m
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/11.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import "BDLocationManager.h"
#import <AMapLocationKit/AMapLocationKit.h>

@interface BDLocationManager () <AMapLocationManagerDelegate>
{
    BDLocationManagerDidUpdateLocationHandle    _updateLocationHandle;
}
@property (nonatomic ,strong) AMapLocationManager * locationManager;
@end

static BDLocationManager * _singleton = nil;
@implementation BDLocationManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[BDLocationManager alloc] init];
    });
    return _singleton;
}

- (void)setUpLocationManagerUploadLocationHandle:(BDLocationManagerDidUpdateLocationHandle)updateLocationHandle
{
    _updateLocationHandle = updateLocationHandle;
}


//开始定位
- (void)startSerialLocation
{
    if (self.canLocationFlag == NO) {
        return;
    }
    [self.locationManager startUpdatingLocation];
}


//停止定位
- (void)stopSerialLocation
{
    [self.locationManager stopUpdatingLocation];
}


#pragma mark    - AMapLocationManager
//  定位错误
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error = %@" , error);
}

//  定位结果
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    // 维度
    NSString * currentLatitude = [[NSString alloc]initWithFormat:@"%f",location.coordinate.latitude];
    // 经度
    NSString * currentLongitude = [[NSString alloc] initWithFormat:@"%f",location.coordinate.longitude];
    
    [[NSUserDefaults standardUserDefaults] setObject:currentLatitude forKey:kBDUserCurrentLatitude];
    [[NSUserDefaults standardUserDefaults] setObject:currentLongitude forKey:kBDUserCurrentLongitude];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (_updateLocationHandle) {
        _updateLocationHandle(location , currentLatitude , currentLongitude);
    }
}

- (AMapLocationManager *)locationManager
{
    if (!_updateLocationHandle) {
        AMapLocationManager * locationManager = [[AMapLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.pausesLocationUpdatesAutomatically = NO;
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        locationManager.allowsBackgroundLocationUpdates = NO;
    }
    return _locationManager;
}

- (BOOL)isCanLocationFlag
{
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (BOOL)hasLocation
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kBDUserCurrentLongitude] length] && [[[NSUserDefaults standardUserDefaults] objectForKey:kBDUserCurrentLatitude] length];
}

@end
