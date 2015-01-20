//
//  QualityManager.h
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * Holds images' quality parameter.
 */
@interface QualityManager : NSObject
@property (nonatomic, assign) CGInterpolationQuality quality;
+(id)sharedInstance;

@end
