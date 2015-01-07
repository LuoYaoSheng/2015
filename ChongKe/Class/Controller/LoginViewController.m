//
//  LoginViewController.m
//  MShops
//
//  Created by Air on 14/12/13.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "RootViewController.h"

@interface LoginViewController ()<UITextFieldDelegate, RequestResultProtocol>
{
    PlusTextField *_tfTel;
    PlusTextField *_tfPwd;
    NetRequest *_request;
    BOOL _isLogin;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self DATA_init];
    [self UI_init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    NSString *tel = [ud objectForKey:@"tel"];
    NSString *pwd = [ud objectForKey:@"pwd"];
    _tfTel.text = tel;
    _tfPwd.text = pwd;
    if ( pwd.length > 0) {
        [self loginAction];
        _isLogin = YES;
    }else{
        _isLogin = NO;
    }
}

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
    
    UIView *loginView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-2*SPACE_BASIC, 300)];
    [loginView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:loginView];
    loginView.center = CGPointMake(self.view.center.x, self.view.center.y-20);
    
    _tfTel = [[PlusTextField alloc]initWithFrame:CGRectMake( SPACE_BASIC*2, 8, loginView.frame.size.width-4*SPACE_BASIC, 42)];
    [loginView addSubview:_tfTel];
    _tfTel.borderStyle = UITextBorderStyleRoundedRect;
    _tfTel.keyboardType = UIKeyboardTypeNumberPad;
    _tfTel.delegate = self;
    _tfTel.placeholder = @"请输入手机号";
    
    _tfPwd = [[PlusTextField alloc]initWithFrame:CGRectMake( SPACE_BASIC*2, 65, loginView.frame.size.width-4*SPACE_BASIC, 42)];
    [loginView addSubview:_tfPwd];
    _tfPwd.borderStyle = UITextBorderStyleRoundedRect;
    _tfPwd.delegate = self;
    _tfPwd.secureTextEntry = YES;
    _tfPwd.placeholder = @"请输入密码";
    
    UIButton *btn = [UIButton createRedRadius:CGRectMake( SPACE_BASIC*2, 123, loginView.frame.size.width-4*SPACE_BASIC, 42)];
    [loginView addSubview:btn];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake((loginView.frame.size.width-111)*0.5, loginView.frame.size.height-80, 111, 35)];
    [loginView addSubview:icon];
    [icon setImage:[UIImage imageNamed:@"yd.png"]];
    
    UILabel *hello = [[UILabel alloc]initWithFrame:CGRectMake(0, loginView.frame.size.height-35, loginView.frame.size.width, 21)];
    [loginView addSubview:hello];
    [hello setBackgroundColor:[UIColor clearColor]];
    hello.textAlignment = NSTextAlignmentCenter;
    hello.font = [UIFont boldSystemFontOfSize:17];
    hello.textColor = [StyleKit colorOfBaseDeep];
    hello.text = @"重要厅处级领导信息管理-你的专属";
}

#pragma mark - UITextfield delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return range.location >= 26 ?NO:YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ( textField == _tfTel) {
        [_tfPwd becomeFirstResponder];
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
- (void)loginAction
{
    [self UI_hideKeyboard];
    

    
//    if ( _tfTel.text.length <= 0 || _tfPwd.text.length <= 0) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                            message:@"账号或密码不能为空！"
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"确定"
//                                                  otherButtonTitles:nil];
//        [alertView show];
//        return;
//    }
//    if ( ![NSString isValid:IdentifierTypePhone value:_tfTel.text] ) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                            message:@"请填入正确手机号！"
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"确定"
//                                                  otherButtonTitles:nil];
//        [alertView show];
//        return;
//    }
    
    _tfTel.text = @"15080495236";
    _tfPwd.text = @"111111";
    
    [_request Login:_tfTel.text pwd:_tfPwd.text];
    [SVProgressHUD show];
}

#pragma mark - net delegate
- (void)httpRequestFail:(NSString *) err operation:(int)pOperation
{
    [SVProgressHUD dismissWithError: err ];
}
- (void)httpRequesSucess:(NSDictionary *)pDic operation:(int)pOperation
{
    NSDictionary *dic = [pDic objectForKey:@"data"];
    [SVProgressHUD dismissWithSuccess:@"登录成功！"];

    [[NSUserDefaults standardUserDefaults] setObject:_tfTel.text forKey:@"tel"];
    [[NSUserDefaults standardUserDefaults] setObject:_tfPwd.text forKey:@"pwd"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@", [dic objectForKey:@"name"]] forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@", [dic objectForKey:@"phone"]] forKey:@"phone"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@", [dic objectForKey:@"level_s"]] forKey:@"level_s"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@", [dic objectForKey:@"fs"]] forKey:@"fs"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@", [dic objectForKey:@"id"]] forKey:@"id"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    RootViewController *controller = [[RootViewController alloc]init];
    controller.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    [self.navigationController pushViewController:controller animated:YES];

    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app showLLLockViewController: _isLogin ? LLLockViewTypeCheck:LLLockViewTypeCreate];
}


@end
