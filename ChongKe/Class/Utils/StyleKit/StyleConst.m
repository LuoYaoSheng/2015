//
//  StyleConst.m
//  sex
//
//  Created by app_server on 14/11/11.
//  Copyright (c) 2014年 yunqihudong. All rights reserved.
//

#import "StyleConst.h"

@implementation StyleConst
#define IOS_VS [[[UIDevice currentDevice] systemVersion] floatValue];
static int S_IOS_VS = -1;
+(float)ios{
    if(S_IOS_VS == -1){
        S_IOS_VS = IOS_VS;
    }
    
    return S_IOS_VS;
}
+(BOOL)ios_enable_7{
    return [self ios] >= 7.0;
}
+(BOOL)ios_enable_6{
    return [self ios] >= 6.0;
}
+(BOOL)ios_enable_5{
    return [self ios] >= 5.0;
}
+(BOOL)ios_is_7{
    return [self ios] >= 7.0 && [self ios] < 8.0;
}
+(BOOL)ios_is_6{
    return [self ios] >= 6.0 && [self ios] < 7.0;
}
+(BOOL)ios_is_5{
    return [self ios] >= 5.0 && [self ios] < 6.0;
}

+(CGFloat)getStartPosY{
    if([StyleConst ios_enable_7]){
        return 20;
    }
    
    return 0;
}
@end;