//
//  StyleConst.h
//  sex
//
//  Created by app_server on 14/11/10.
//  Copyright (c) 2014年 yunqihudong. All rights reserved.
//

//沙盒路径定义
#define FILE_NET                    @"httper/session"
#define FILE_ADDRESS                @"httper/address"
#define FILE_SHOPPINGCART           @"httper/shoppingcart"
#define FILE_FIRMORDER              @"httper/firmorder"


#define NOTIFY_TO_SHORT             @"NOTIFY_TO_SHORT"
#define NOTIFY_TO_FULL              @"NOTIFY_TO_FULL"

#define NOTIFY_TO_CONTROLLER        @"NOTIFY_TO_CONTROLLER"
#define NOTIFY_TO_ROOTCONTROLLER    @"NOTIFY_TO_ROOTCONTROLLER"

//跳转广播
#define NOTIFY_NAV_TO               @"NOTIFY_NAV_TO"

#define HEIGHT_BOTTOM               52
#define SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)

//左侧Logo
#define SIZE_MENU_LOGO_WIDTH 59
#define SIZE_MENU_LOGO_HEIGHT 30

//头像
#define SIZE_AVATAR_WIDTH 40
#define SIZE_AVATAR_HEIGHT 40

//顶部菜单
#define SIZE_TOP_FULL 95.0
#define SIZE_TOP_SHORT 40.0

//视频高度
#define SIZE_VIDEO_HEIGHT 175

//搜索框
#define SIZE_SEARCH_WIDTH_FULL 115
#define SIZE_SEARCH_WIDTH_EXTEND 50

//倒计时面板宽高
#define SIZE_COUNT_DOWN_BOARD CGSizeMake(125, 30)

//首页时间倒数模块尺寸
#define SIZE_BLOCK_TIME_LIMIT_HEIGHT 75

//1行2列2标题
#define SIZE_BLOCK_ROW1_COLUMN2_TITLE2_HEIGHT 100

//1行单标题
#define SIZE_BLOCK_ROW1_COLUMN4_TITLE1_HEIGHT 150

//任意行2列2标题
#define SIZE_BLOCK_ROW_ANY_TOPIC_IMAGE_HEIGHT 100

//错落排列2行5个
#define SIZE_BLOCK_ROW2_SCATTERED5_HEIGHT 100

//视频icon大小
#define SIZE_BLOCK_ICON_SIZE 40

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol TopSizeChangeDelegate
-(void)TopSizeChangeDelegate_toShort;
-(void)TopSizeChangeDelegate_toFull;
@end;

@interface StyleConst : NSObject
+(BOOL)ios_enable_7;
+(BOOL)ios_enable_6;
+(BOOL)ios_enable_5;
+(BOOL)ios_is_7;
+(BOOL)ios_is_6;
+(BOOL)ios_is_5;
+(CGFloat)getStartPosY;

@end