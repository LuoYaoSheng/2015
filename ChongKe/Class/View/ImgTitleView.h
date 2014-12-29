//
//  ImgTitleView.h
//  MShops
//
//  Created by Lys on 14/12/13.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ImgTitleType) {
    ImgTitleTypeAll       = 0,
    ImgTitleTypeImg        = 1,
    ImgTitleTypeTitle       = 2,
};

typedef NS_ENUM(NSInteger, FunctionType) {
    FunctionTypeEmpty               = 0,
    FunctionTypeViewController      = 1,
    FunctionTypeLogout              = 2,
    FunctionTypeAlertLock           = 3,
    FunctionTypeCheckUp             = 4,
};

@interface ModelImgTitle : NSObject
@property (nonatomic, strong) NSString *mImg;
@property (nonatomic, strong) NSString *mTitle;
@property (nonatomic) ImgTitleType mType;
@property (nonatomic) FunctionType mFunType;
@property (nonatomic, strong) NSString *mVc;
@end


@interface ImgTitleView : UIView

- (id)initWithFrame:(CGRect)frame andModel:(ModelImgTitle *)pModel;
@property (nonatomic, assign) ModelImgTitle *mModel;

@end
