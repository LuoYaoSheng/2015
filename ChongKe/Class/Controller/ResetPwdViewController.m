//
//  ResetPwdViewController.m
//  ChongKe
//
//  Created by Lys on 14/12/20.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "ResetPwdViewController.h"

@interface ResetPwdViewController ()< UITextFieldDelegate, RequestResultProtocol>
{
    PlusTextField *_tfPwd[3];
    NetRequest *_request;
}
@end

@implementation ResetPwdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self DATA_init];
    [self UI_init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    [SVProgressHUD dismiss];
//    _request.delegate = nil;
//    [_request clearRequest];
//}

#pragma mark - data init
- (void)DATA_init
{
    _request = [[NetRequest alloc]init];
    _request.delegate = self;
}

#pragma mark - ui init
- (void)UI_init
{
    [self.view setBackgroundColor:[StyleKit colorOfBaseBackground]];
    
    UIButton *btnAdd = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 28)];
    btnAdd.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btnAdd setTitle:@"提交" forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    [self setRightButton:btnAdd pMarginRight:0];
    
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(SPACE_BASIC, [self getStartOffsetY]+10, self.view.frame.size.width-SPACE_BASIC-10, 138) ];
    [view setBackgroundColor:[UIColor whiteColor]];
    [[view layer] setCornerRadius:6.0f];
    [self.view addSubview:view];
    
    NSArray *arrName = [NSArray arrayWithObjects:@"原密码", @"新密码", @"确认密码",nil];
    
    for (int i = 0; i < arrName.count; i++) {
        if ( i != 0 ) {
            UIImageView *ivLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 46*i, view.frame.size.width, 1)];
            [view addSubview:ivLine];
            [ivLine setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.6]];
        }
        
        UIFont *font = [UIFont boldSystemFontOfSize:17];
        NSLineBreakMode lineBreakMode = NSLineBreakByCharWrapping;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 46*i, view.frame.size.width-10, 46)];
        label.font = font;
        label.lineBreakMode = lineBreakMode;
        label.backgroundColor = [UIColor clearColor];
        [view addSubview:label];
        label.textAlignment = NSTextAlignmentRight;
        
        NSString *strName = [arrName objectAtIndex:i];
        label.text = strName;
        
        _tfPwd[ i ] = [[PlusTextField alloc]initWithFrame:CGRectMake(5, 46*i, view.frame.size.width-10, 46)];
        _tfPwd[ i ].placeholder = @"请输入";
        [view addSubview: _tfPwd[ i ] ];
        _tfPwd[ i ].textColor = [UIColor colorWithWhite:0.6 alpha:1];
        _tfPwd[ i ].delegate = self;
        [_tfPwd[ i ] setSecureTextEntry:YES];
        
        CGSize size = [strName sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, 46) lineBreakMode:lineBreakMode];
        label.text = strName;
        
        UILabel *start = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.size.width+label.frame.origin.x-size.width-5, 46*i+6, 30, 46)];
        [start setBackgroundColor:[UIColor clearColor]];
        [start setTextColor:[UIColor redColor]];
        [start setFont:font];
        [start setText:@"*"];
        [view addSubview:start];
    }
    
}

#pragma mark - UITextfield delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return range.location >= 26 ?NO:YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ( textField == _tfPwd[0]) {
        [_tfPwd[1] becomeFirstResponder];
    }if ( textField == _tfPwd[1]) {
        [_tfPwd[2] becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self performSelectorOnMainThread:@selector(UI_hideKeyboard) withObject:nil waitUntilDone:YES];
    [super touchesEnded:touches withEvent:event];
}

- (void)UI_hideKeyboard
{
    [self.view endEditing:YES];
}

#pragma mark - button action
- (void)submitAction
{
    [self UI_hideKeyboard];

    if ( _tfPwd[0].text.length <= 0 || _tfPwd[1].text.length <= 0 || _tfPwd[2].text.length <= 0 ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"新旧密码不能为空！"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    NSString *pwd = [ud objectForKey:@"pwd"];
    if ( ![pwd isEqualToString:_tfPwd[0].text] ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"旧密码输入错误！"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    if ( ![_tfPwd[1].text isEqualToString:_tfPwd[2].text] ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"新密码验证不正确！"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    NSString *name = [ud objectForKey:@"tel"];
    [_request Login_newpwd:name pwd: _tfPwd[1].text];
    [SVProgressHUD show];
}



#pragma mark - net delegate
- (void)httpRequestFail:(NSString *) err operation:(int)pOperation
{
    [SVProgressHUD dismissWithError: err ];
}
- (void)httpRequesSucess:(NSDictionary *)pDic operation:(int)pOperation
{
    [SVProgressHUD dismissWithSuccess:@"密码修改成功！"];
    [self.navigationController popViewControllerAnimated:YES];
    [[NSUserDefaults standardUserDefaults] setObject:_tfPwd[1].text forKey:@"pwd"];
}

@end
