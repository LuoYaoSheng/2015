//
//  Common.h
//  IconUtility
//
//  Created by 罗耀生 on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#ifndef IconUtility_Common_h
#define IconUtility_Common_h

enum{
    TAG_osx     = 100,
    TAG_iPhone  ,
    TAG_iPad    ,
    TAG_Android ,

    TAG_export  = 300,
};

enum{
    TAG_img_icon = 200,
    TAG_img_defalut,
};

#define ICON_WIDTH   280
#define ICON_HIGHT   280

#define FILENAMELIST            @[@"OSX",@"iPhone",@"iPad",@"Android"]
#define DefaultDirectoryName    @"图片生成"

#endif
