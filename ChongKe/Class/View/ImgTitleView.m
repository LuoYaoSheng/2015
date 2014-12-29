//
//  ImgTitleView.m
//  MShops
//
//  Created by Lys on 14/12/13.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "ImgTitleView.h"

@implementation ModelImgTitle
@end

@implementation ImgTitleView

- (id)initWithFrame:(CGRect)frame andModel:(ModelImgTitle *)pModel
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _mModel = pModel;
        [self DATA_init];
        [self UI_init];
    }
    return self;
}

#pragma mark - data 
- (void)DATA_init
{
    
}

#pragma mark - ui
- (void)UI_init
{
    switch ( _mModel.mType ) {
        case ImgTitleTypeAll:
            [self UI_imgTitle];
            break;
            
        case ImgTitleTypeImg:
            [self UI_img];
            break;
            
        default:
            [self UI_title];
            break;
    }
}

- (void)UI_imgTitle
{
    [self setBackgroundColor:[UIColor whiteColor]];
    [[self layer]setCornerRadius:4.0];
    
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(7, 8, 28, 28)];
    [self addSubview:icon];
    [icon setImage:[UIImage imageNamed:_mModel.mImg]];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(42, 10, 95, 21)];
    [self addSubview:title];
    [title setBackgroundColor:[UIColor clearColor]];
    title.font = [UIFont boldSystemFontOfSize:15];
    title.text = _mModel.mTitle;
    
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-20, 17, 10, 10)];
    [self addSubview:arrow];
    [arrow setImage:[UIImage imageNamed:@"arrow_icon.png"]];
}

- (void)UI_img
{
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake((self.frame.size.width-111)*0.5, (self.frame.size.height-35)*0.5, 111, 35)];
    [self addSubview:icon];
    [icon setImage:[UIImage imageNamed:_mModel.mImg]];
}

- (void)UI_title
{
    [self setBackgroundColor:[StyleKit colorOfBaseDeep]];
    [[self layer]setCornerRadius:4.0];
    
    UILabel *title = [[UILabel alloc]initWithFrame:self.bounds];
    [self addSubview:title];
    [title setBackgroundColor:[UIColor clearColor]];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont boldSystemFontOfSize:17];
    title.text = _mModel.mTitle;
}

@end
