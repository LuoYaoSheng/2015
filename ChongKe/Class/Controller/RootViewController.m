//
//  RootViewController.m
//  MShops
//
//  Created by Lys on 14/12/13.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"
#import "ImgTitleView.h"
#import "HelloSbView.h"
#import "LoginViewController.h"
#import "MyViewController.h"
#import "ManageListViewController.h"

#import "ExpenseCalendarViewController.h"

@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, RequestResultProtocol>
{
    UITableView *_tableView;
    NSMutableArray *_modelList;
    NetRequest *_request;
    int _type;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self DATA_init];
    [self UI_init];
    
    //    ExpenseCalendarViewController *controller = [[ExpenseCalendarViewController alloc]init];
    //    controller.title = @"消费记录";
    //    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_TO_CONTROLLER object:controller];
}

- (void)didReceiveMemoryWarning {
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
    _modelList = [[NSMutableArray alloc]init];
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    int level_s = [[ud objectForKey:@"level_s"]intValue];
    
    NSArray *imgs,*titles,*types,*funTypes,*vcs ;
    
    if ( 10 == level_s ) {
        
        imgs = [NSArray arrayWithObjects:@"yd.png",@"ic_my.png",@"ic_my.png", @"ic_pic_pwd.png", @"ic_login_pwd.png", @"ic_update.png", @"ic_feedback.png", @"ic_about.png",@"", nil];
        titles = [NSArray arrayWithObjects:@"",@"我的重客集团", @"管理客户经理", @"修改图形密码", @"修改登录密码", @"检查更新", @"意见反馈", @"关于我们",@"退出登录", nil];
        types = [NSArray arrayWithObjects:[NSNumber numberWithInteger:ImgTitleTypeImg],[NSNumber numberWithInteger:ImgTitleTypeAll], [NSNumber numberWithInteger:ImgTitleTypeAll],[NSNumber numberWithInteger:ImgTitleTypeAll], [NSNumber numberWithInteger:ImgTitleTypeAll], [NSNumber numberWithInteger:ImgTitleTypeAll], [NSNumber numberWithInteger:ImgTitleTypeAll],[NSNumber numberWithInteger:ImgTitleTypeAll],[NSNumber numberWithInteger:ImgTitleTypeTitle], nil];
        funTypes = [NSArray arrayWithObjects:[NSNumber numberWithInteger:FunctionTypeEmpty],
                    [NSNumber numberWithInteger:FunctionTypeViewController],
                    [NSNumber numberWithInteger:FunctionTypeViewController],
                    [NSNumber numberWithInteger:FunctionTypeAlertLock],
                    [NSNumber numberWithInteger:FunctionTypeViewController],
                    [NSNumber numberWithInteger:FunctionTypeCheckUp],
                    [NSNumber numberWithInteger:FunctionTypeViewController],
                    [NSNumber numberWithInteger:FunctionTypeViewController],
                    [NSNumber numberWithInteger:FunctionTypeLogout], nil];
        vcs = [NSArray arrayWithObjects:@"",
               @"MyViewController",
               @"ManageListViewController",
               @"LockViewController",
               @"ResetPwdViewController",
               @"",
               @"FeedBackViewController",
               @"AboutViewController",
               @"", nil];
        
    }else{
        imgs = [NSArray arrayWithObjects:@"yd.png",@"ic_my.png", @"ic_pic_pwd.png", @"ic_login_pwd.png", @"ic_update.png", @"ic_feedback.png", @"ic_about.png",@"", nil];
        titles = [NSArray arrayWithObjects:@"",@"我的重客集团", @"修改图形密码", @"修改登录密码", @"检查更新", @"意见反馈", @"关于我们",@"退出登录", nil];
        types = [NSArray arrayWithObjects:[NSNumber numberWithInteger:ImgTitleTypeImg],[NSNumber numberWithInteger:ImgTitleTypeAll], [NSNumber numberWithInteger:ImgTitleTypeAll], [NSNumber numberWithInteger:ImgTitleTypeAll], [NSNumber numberWithInteger:ImgTitleTypeAll], [NSNumber numberWithInteger:ImgTitleTypeAll],[NSNumber numberWithInteger:ImgTitleTypeAll],[NSNumber numberWithInteger:ImgTitleTypeTitle], nil];
        funTypes = [NSArray arrayWithObjects:[NSNumber numberWithInteger:FunctionTypeEmpty],
                    [NSNumber numberWithInteger:FunctionTypeViewController],
                    [NSNumber numberWithInteger:FunctionTypeAlertLock],
                    [NSNumber numberWithInteger:FunctionTypeViewController],
                    [NSNumber numberWithInteger:FunctionTypeCheckUp],
                    [NSNumber numberWithInteger:FunctionTypeViewController],
                    [NSNumber numberWithInteger:FunctionTypeViewController],
                    [NSNumber numberWithInteger:FunctionTypeLogout], nil];
        vcs = [NSArray arrayWithObjects:@"",
               @"MyViewController",
               @"LockViewController",
               @"ResetPwdViewController",
               @"",
               @"FeedBackViewController",
               @"AboutViewController",
               @"", nil];
    }
    
    
    for (int idx = 0; idx < titles.count; idx++) {
        
        ModelImgTitle *imgTitle = [[ModelImgTitle alloc]init];
        imgTitle.mImg = [imgs objectAtIndex:idx];
        imgTitle.mTitle = [titles objectAtIndex:idx];
        imgTitle.mType = [[types objectAtIndex:idx]integerValue];
        imgTitle.mFunType = [[funTypes objectAtIndex:idx]integerValue];
        imgTitle.mVc = [vcs objectAtIndex:idx];
        [_modelList addObject:imgTitle];
    }
    
    //注册界面跳转通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toController:) name:NOTIFY_TO_CONTROLLER object:nil];
    
    _request = [[NetRequest alloc]init];
    _request.delegate = self;
}

#pragma mark - ui init
- (void)UI_init
{
    //去掉返回键
    [self hiddenBackButton];
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    NSString *name = [ud objectForKey:@"name"];
    
    //设置界面
    HelloSbView *vHello = [[HelloSbView alloc]initWithFrame:CGRectMake(0, [self getStartOffsetY]+5, self.view.frame.size.width, 21) andName:name];
    vHello.center = CGPointMake(self.view.center.x, vHello.center.y);
    [self.view addSubview:vHello];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(SPACE_BASIC, [self getStartOffsetY]+30, self.view.frame.size.width-2*SPACE_BASIC, self.view.frame.size.height-[self getStartOffsetY]-26)];
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [[UIView alloc]init];
    [_tableView setBackgroundColor:[UIColor clearColor]];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_modelList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"staticCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }else{
        for (UIView *subView in cell.contentView.subviews){
            [subView removeFromSuperview];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.backgroundColor = [UIColor clearColor];
    
    ModelImgTitle *model = [_modelList objectAtIndex:indexPath.row];
    if ( ImgTitleTypeImg == model.mType) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    ImgTitleView *imgTitle = [[ImgTitleView alloc]initWithFrame:CGRectMake(5, 5, _tableView.frame.size.width-10, 42) andModel:[_modelList objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:imgTitle];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    //    return cell.frame.size.height;
    return 56;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    ModelImgTitle *model = [_modelList objectAtIndex:indexPath.row];
    
    _type = model.mType;
    
    if ( ImgTitleTypeAll == model.mType ) {
        
        if ( FunctionTypeViewController == model.mFunType) {
            
            Class class = NSClassFromString( model.mVc );
            UIViewController *controller = [[class alloc]init];
            controller.title = model.mTitle;
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_TO_CONTROLLER object:controller];
        }else if ( FunctionTypeAlertLock == model.mFunType ){
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"修改图形密码"
                                                                message:@"温馨提示:确认【修改】后,您将需重新设置图形密码!"
                                                               delegate:self
                                                      cancelButtonTitle:@"修改"
                                                      otherButtonTitles:@"取消", nil];
            alertView.tag = 10086;
            [alertView show];
        }else if( FunctionTypeCheckUp == model.mFunType ){
            [self checkVersion];
        }
    }else{
        if ( FunctionTypeLogout == model.mFunType) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"修改图形密码"
                                                                message:@"温馨提示:退出登录后下次打开需要重新登录,确定要退出登录并退出程序吗？ "
                                                               delegate:self
                                                      cancelButtonTitle:@"修改"
                                                      otherButtonTitles:@"取消", nil];
            alertView.tag = 10087;
            [alertView show];
        }
    }
}

#pragma mark - 通知
- (void)toController:(NSNotification*)pNotify{
    [self.navigationController pushViewController:pNotify.object animated:YES];
}

#pragma mark - delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( alertView.tag == 10086) {
        if ( buttonIndex == 0) {
            AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            [app showLLLockViewController:LLLockViewTypeCreate];
        }
    }else if ( alertView.tag == 10087){
        if ( buttonIndex == 0) {
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"pwd"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }else{
        if ( buttonIndex == 1) {
            NSString *iTunesLink = @"itms-apps://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftwareUpdate?id=<appid>&mt=8";
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
        }
    }
}

#pragma mark ---
- (void)checkVersion
{
    _type = 1000;
    [_request Check_update];
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
    [SVProgressHUD dismiss];
    
    NSString *version = @"";
    NSArray *configData = [dic valueForKey:@"results"];
    for (id config in configData)
    {
        version = [config valueForKey:@"version"];
    }
    //Check your version with the version in app store
    NSString *localVersion = [[[NSBundle mainBundle] infoDictionary]  objectForKey:@"CFBundleShortVersionString"];
    if (![version isEqualToString: localVersion ])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"新版本"
                                                            message:@"有新版了哦，是否前往下载！"
                                                           delegate:self
                                                  cancelButtonTitle:@"取消"
                                                  otherButtonTitles:@"前往",nil];
        [alertView show];
        
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"当前为最新版本！"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
}
@end
