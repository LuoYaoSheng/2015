//
//  HelloSbView.m
//  MShops
//
//  Created by Air on 14/12/13.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "HelloSbView.h"

#define UIFont_NAME             [UIFont boldSystemFontOfSize:15]
#define NSLineBreakMode_NAME    NSLineBreakByCharWrapping

@interface HelloSbView()
{
    UILabel *_lName;
    UILabel *_lIntroduce;
}
@end

@implementation HelloSbView

- (id)initWithFrame:(CGRect)frame andName:(NSString *)pName
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _mName = pName;
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
    [self setBackgroundColor:[UIColor clearColor]];

    UILabel *hello = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 57, 21)];
    [self addSubview:hello];
    [hello  setBackgroundColor:[UIColor clearColor]];
    hello.font = UIFont_NAME;
    hello.textColor = [StyleKit colorOfGreen];
    hello.text = @"你好，";
    
    _lName = [[UILabel alloc]initWithFrame:CGRectMake(hello.frame.origin.x+hello.frame.size.width-10, 0, 100, 21)];
    [self addSubview:_lName];
    [_lName  setBackgroundColor:[UIColor clearColor]];
    _lName.font = UIFont_NAME;
    _lName.textColor = [StyleKit colorOfBaseDeep];
    _lName.lineBreakMode = NSLineBreakMode_NAME;
    _lName.text = _mName;
    
    CGSize size = [_mName sizeWithFont:UIFont_NAME constrainedToSize:CGSizeMake(CGFLOAT_MAX, 21) lineBreakMode:NSLineBreakMode_NAME];
    CGRect frame = _lName.frame;
    frame.size.width = size.width;
    _lName.frame = frame;
    
    NSString *introduce = @"欢迎使用重客管理平台";
    float originX = frame.origin.x+frame.size.width;
    size = [introduce sizeWithFont:UIFont_NAME constrainedToSize:CGSizeMake(CGFLOAT_MAX, 21) lineBreakMode:NSLineBreakMode_NAME];
    
    _lIntroduce = [[UILabel alloc]initWithFrame:CGRectMake(originX, 0, size.width, 21)];
    [self addSubview:_lIntroduce];
    [_lIntroduce  setBackgroundColor:[UIColor clearColor]];
    _lIntroduce.font = UIFont_NAME;
    _lIntroduce.textColor = [StyleKit colorOfGreen];
    _lIntroduce.text = introduce;
    
    frame = self.frame;
    frame.size.width = _lIntroduce.frame.origin.x + _lIntroduce.frame.size.width;
    self.frame = frame;
//    self.center = CGPointMake(self.superview.center.x, self.center.y);
}

@end
