//
//  ColorButton.m
//  MShops
//
//  Created by Air on 14/12/23.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "ColorButton.h"

@implementation ColorButton


- (instancetype)initWithFrame:(CGRect)pFrame pColorNormal:(UIColor *)pColorNormal pColorSelected:(UIColor *)pColorSelected
{
    return [self initWithFrame:pFrame pRadius:YES pColorNormal:pColorNormal pColorHighlighted:pColorSelected pColorSelected:pColorSelected pColorDisabled:pColorSelected];
}
- (instancetype)initWithFrame:(CGRect)pFrame pColorNormal:(UIColor *)pColorNormal pColorHighlighted:(UIColor *)pColorHighlighted pColorSelected:(UIColor *)pColorSelected
{
    return [self initWithFrame:pFrame pRadius:YES pColorNormal:pColorNormal pColorHighlighted:pColorHighlighted pColorSelected:pColorSelected pColorDisabled:pColorSelected];
}
- (instancetype)initWithFrame:(CGRect)pFrame pColorNormal:(UIColor *)pColorNormal pColorHighlighted:(UIColor *)pColorHighlighted pColorSelected:(UIColor *)pColorSelected pColorDisabled:(UIColor *)pColorDisabled
{
    return [self initWithFrame:pFrame pRadius:YES pColorNormal:pColorNormal pColorHighlighted:pColorHighlighted pColorSelected:pColorSelected pColorDisabled:pColorDisabled];
}

- (instancetype)initWithFrame:(CGRect)pFrame pRadius:(BOOL)pRadius pColorNormal:(UIColor *)pColorNormal pColorSelected:(UIColor *)pColorSelected
{
    return [self initWithFrame:pFrame pRadius:pRadius pColorNormal:pColorNormal pColorHighlighted:pColorSelected pColorSelected:pColorSelected pColorDisabled:pColorSelected];
}
- (instancetype)initWithFrame:(CGRect)pFrame pRadius:(BOOL)pRadius pColorNormal:(UIColor *)pColorNormal pColorHighlighted:(UIColor *)pColorHighlighted pColorSelected:(UIColor *)pColorSelected
{
    return [self initWithFrame:pFrame pRadius:pRadius pColorNormal:pColorNormal pColorHighlighted:pColorHighlighted pColorSelected:pColorSelected pColorDisabled:pColorSelected];
}

- (instancetype)initWithFrame:(CGRect)pFrame pRadius:(BOOL)pRadius pColorNormal:(UIColor *)pColorNormal pColorHighlighted:(UIColor *)pColorHighlighted pColorSelected:(UIColor *)pColorSelected pColorDisabled:(UIColor *)pColorDisabled
{
    self = [super initWithFrame:pFrame];
    if(self != nil){

        [self setBackgroundImage:[UIImage createImageWithColor:pColorNormal] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage createImageWithColor:pColorHighlighted] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[UIImage createImageWithColor:pColorSelected] forState:UIControlStateSelected];
        [self setBackgroundImage:[UIImage createImageWithColor:pColorDisabled] forState:UIControlStateDisabled];
        if ( pRadius ) {
            float radius = pFrame.size.width > pFrame.size.height ? pFrame.size.height:pFrame.size.width;
//            radius *= 0.5*0.1;半径取0.1
            radius *= 0.1;            
            [[self layer]setCornerRadius: radius ];
        }
    }
    
    return self;
}

@end

