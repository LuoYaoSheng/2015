//
//  BaseSubViewController.h
//  MShops
//
//  Created by app_server on 14/11/18.
//  Copyright (c) 2014年 yunqihudong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseSubViewController : UIViewController

@property (nonatomic, retain) UIView* topBar;

- (CGFloat)getStartOffsetY;
-(void)onBack;
-(void)hiddenBackButton;
-(UIView*)getTopBar;
-(void)setRightButton:(UIButton*)pButton;
-(void)setRightButton:(UIButton*)pButton pMarginRight:(CGFloat)pMarginRight;
-(void)onRightButtonClick;
@end
