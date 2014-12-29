//
//  UIKitExt.h
//  MShops
//
//  Created by Air on 14/12/17.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, IdentifierType) {
    IdentifierTypeKnown = 0,
    IdentifierTypeZipCode,      //1
    IdentifierTypeEmail,        //2
    IdentifierTypePhone,        //3
    IdentifierTypeUnicomPhone,  //4
    IdentifierTypeQQ,           //5
    IdentifierTypeNumber,       //6
    IdentifierTypeString,       //7
    IdentifierTypeIdentifier,   //8
    IdentifierTypePassort,      //9
    IdentifierTypeCreditNumber, //10
    IdentifierTypeBirthday,     //11
    
    IdentifierTypeArea,//新增
};

@interface UIButton(Radius)

+ (UIButton *)createRedRadius:(CGRect)pFrame ;
+ (UIButton *)createGrayRadius:(CGRect)pFrame ;
+ (UIButton *)createOrangeRadius:(CGRect)pFrame ;
+ (UIButton *)createWhiteNotRadius:(CGRect)pFrame ;

@end

@interface NSString(Ext)

+ (BOOL) isValid:(IdentifierType) type value:(NSString*) value;
+ (NSString *)getCurrentDeviceModel;

@end

@interface UIImage(Ext)
+ (UIImage*) createImageWithColor: (UIColor*) color;
@end