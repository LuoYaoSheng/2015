//
//  BaseSubViewController.m
//  MShops
//
//  Created by app_server on 14/11/18.
//  Copyright (c) 2014年 yunqihudong. All rights reserved.
//

#import "BaseSubViewController.h"
@interface BaseSubViewController (){
//    UIView* _topBar;
    CGFloat _startOffsetY;
    UILabel* _title;
    BOOL _poped;
    UIButton* _back;
    UIButton* _rightButton;
}

@end

@implementation BaseSubViewController


-(UIView *)getTopBar{
    return _topBar;
}

-(void)hiddenBackButton{
    _back.hidden = YES;
}

- (CGFloat)getStartOffsetY{
    return _startOffsetY;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _poped = NO;
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [StyleKit colorOfBaseBackground];
    
    if([StyleConst ios_enable_7]){
        UIView* statusBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        [statusBar setBackgroundColor:[StyleKit colorOfBaseDeep]];
        [self.view addSubview:statusBar];
    }
    
    
    CGRect frameTopBar = CGRectMake(0, [StyleConst getStartPosY], self.view.frame.size.width, SIZE_TOP_SHORT);
    _topBar = [[UIView alloc] initWithFrame:frameTopBar];
    [_topBar setBackgroundColor:[StyleKit colorOfBaseDeep]];
    [self.view addSubview:_topBar];
    
    _back = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, SIZE_TOP_SHORT)];
    [_back setImage:[StyleKit imageOfBack] forState:UIControlStateNormal];
    [_back setImage:[StyleKit imageOfBackSelected] forState:UIControlStateSelected];
    [_back setImage:[StyleKit imageOfBackSelected] forState:UIControlStateHighlighted];
    [_back addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addSubview:_back];
    
    _startOffsetY = _topBar.frame.size.height+_topBar.frame.origin.y;
    
    _title = [[UILabel alloc] init];
    _title.backgroundColor = [UIColor clearColor];
    _title.textColor = [StyleKit colorOfWhite];
    _title.font = [UIFont boldSystemFontOfSize:20];
    _title.contentMode = UIViewContentModeCenter;
    _title.textAlignment = NSTextAlignmentCenter;
    [_topBar addSubview:_title];
    
    
    _title.text = self.title;
    [_title sizeToFit];
    CGRect frameTitle = _title.frame;
    frameTitle.origin.x = (_topBar.frame.size.width-_title.frame.size.width)/2;
    frameTitle.origin.y = (_topBar.frame.size.height-_title.frame.size.height)/2;
    _title.frame = frameTitle;
}

-(void)onBack{
    if(_poped == YES){
        return;
    }
    _poped = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setRightButton:(UIButton*)pButton{
    [self setRightButton:pButton pMarginRight:0];
}
-(void)setRightButton:(UIButton*)pButton pMarginRight:(CGFloat)pMarginRight{
    if([pButton isEqual:_rightButton]){
        return;
    }
    
    if(_rightButton != nil){
        [_rightButton removeFromSuperview];
    }
    
    if(pButton == nil){
        return;
    }
    
    CGRect frame = pButton.frame;
    frame.origin.x = _topBar.frame.size.width - frame.size.width - pMarginRight;
    frame.origin.y = (_topBar.frame.size.height - frame.size.height)/2;
    pButton.frame = frame;
    [pButton addTarget:self action:@selector(onRightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_topBar addSubview:pButton];
}

-(void)onRightButtonClick{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

@end
