//
//  BDServiceListModel.h
//  K_BasicDemo
//
//  Created by kevin.zhang on 16/10/18.
//  Copyright © 2016年 kevin.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BDBasicModel.h"
@interface BDServiceListModel : BDBasicModel

@property (nonatomic, copy) NSString *  name;
@property (nonatomic, copy) NSString *  url;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger refresh_interval;

@end
