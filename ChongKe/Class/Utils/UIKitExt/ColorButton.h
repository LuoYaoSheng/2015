//
//  ColorButton.h
//  MShops
//
//  Created by Air on 14/12/23.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorButton : UIButton

- (instancetype)initWithFrame:(CGRect)pFrame pColorNormal:(UIColor *)pColorNormal pColorSelected:(UIColor *)pColorSelected;
- (instancetype)initWithFrame:(CGRect)pFrame pColorNormal:(UIColor *)pColorNormal pColorHighlighted:(UIColor *)pColorHighlighted pColorSelected:(UIColor *)pColorSelected;
- (instancetype)initWithFrame:(CGRect)pFrame pColorNormal:(UIColor *)pColorNormal pColorHighlighted:(UIColor *)pColorHighlighted pColorSelected:(UIColor *)pColorSelected pColorDisabled:(UIColor *)pColorDisabled;

- (instancetype)initWithFrame:(CGRect)pFrame pRadius:(BOOL)pRadius pColorNormal:(UIColor *)pColorNormal pColorSelected:(UIColor *)pColorSelected;
- (instancetype)initWithFrame:(CGRect)pFrame pRadius:(BOOL)pRadius pColorNormal:(UIColor *)pColorNormal pColorHighlighted:(UIColor *)pColorHighlighted pColorSelected:(UIColor *)pColorSelected;
- (instancetype)initWithFrame:(CGRect)pFrame pRadius:(BOOL)pRadius pColorNormal:(UIColor *)pColorNormal pColorHighlighted:(UIColor *)pColorHighlighted pColorSelected:(UIColor *)pColorSelected pColorDisabled:(UIColor *)pColorDisabled;

@end


