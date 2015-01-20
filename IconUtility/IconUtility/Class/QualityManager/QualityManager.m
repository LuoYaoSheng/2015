//
//  QualityManager.m
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import "QualityManager.h"

static id _instance = nil;

@implementation QualityManager

//Override
+(id)alloc{
    NSLog(@"%@: Direct usage of +alloc is not allowded.", [self class]);
    return nil;
}

+(id)sharedInstance{
    if (_instance == nil){
        _instance = [[[self class] hiddenAlloc] init];
    }
    return _instance;
}

-(id)init{
    if (_instance){
        return _instance;
    }
    
    if (self = [super init]){
        [self setup];
    }
    return self;
}

#pragma mark -
#pragma mark Private class method

+(id)hiddenAlloc{
    return [super alloc];
}

-(void)setup{
    _quality = kCGInterpolationDefault;
}

@end