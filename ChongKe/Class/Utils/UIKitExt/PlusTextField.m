//
//  PlusTextField.m
//  MShops
//
//  Created by Air on 14/12/22.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "PlusTextField.h"

@implementation PlusTextField

- (CGRect)borderRectForBounds:(CGRect)bounds
{
    return [StyleConst ios_enable_7]?CGRectMake(bounds.origin.x+5, bounds.origin.y, bounds.size.width-5, bounds.size.height):CGRectMake(bounds.origin.x, bounds.size.height*0.5-self.font.capHeight, bounds.size.width, bounds.size.height);
}
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return [StyleConst ios_enable_7]?CGRectMake(bounds.origin.x+5, bounds.origin.y, bounds.size.width-5, bounds.size.height):CGRectMake(bounds.origin.x, bounds.size.height*0.5-self.font.capHeight, bounds.size.width, bounds.size.height);
}
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return [StyleConst ios_enable_7]?CGRectMake(bounds.origin.x+5, bounds.origin.y, bounds.size.width-5, bounds.size.height):CGRectMake(bounds.origin.x, bounds.size.height*0.5-self.font.capHeight, bounds.size.width, bounds.size.height);
}
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return [StyleConst ios_enable_7]?CGRectMake(bounds.origin.x+5, bounds.origin.y, bounds.size.width-5, bounds.size.height):CGRectMake(bounds.origin.x, bounds.size.height*0.5-self.font.capHeight, bounds.size.width, bounds.size.height);
}
- (CGRect)clearButtonRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x+bounds.size.width*0.5-10, bounds.origin.y, bounds.size.width, bounds.size.height);
}
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    return [StyleConst ios_enable_7]?CGRectMake(bounds.origin.x+5, bounds.origin.y, bounds.size.width-5, bounds.size.height):CGRectMake(bounds.origin.x, bounds.size.height*0.5-self.font.capHeight, bounds.size.width, bounds.size.height);
}
- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
    return [StyleConst ios_enable_7]?CGRectMake(bounds.origin.x+5, bounds.origin.y, bounds.size.width-5, bounds.size.height):CGRectMake(bounds.origin.x, bounds.size.height*0.5-self.font.capHeight, bounds.size.width, bounds.size.height);
}


@end
