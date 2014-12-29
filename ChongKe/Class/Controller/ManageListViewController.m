//
//  ManageListViewController.m
//  ChongKe
//
//  Created by Air on 14/12/27.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "ManageListViewController.h"
@interface ManageListViewController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, RequestResultProtocol>
{
    NetRequest *_request;
    NSMutableArray *_dataList;
    NSMutableArray *_searchList;
    
    PlusTextField *_textField;
    UITableView *_tableView;
}
@end

@implementation ManageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self DATA_init];
    [self UI_init];
    [self refreshAction];
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
    _request = [[NetRequest alloc]init];
    _request.delegate = self;
    
    _dataList = [[NSMutableArray alloc]init];
    _searchList = [[NSMutableArray alloc]init];
}

- (void)DATA_collator:(NSString *)text
{
    [_searchList removeAllObjects];
    for (NSDictionary *dic in _dataList) {

        NSString *name = [dic objectForKey:@"name"];
        NSRange range_name = [name rangeOfString: text ];

        if ( range_name.length > 0 || text.length <= 0)
        {
            [_searchList addObject:dic];
        }
    }
}

#pragma mark - ui init
- (void)UI_init
{
    [self.view setBackgroundColor:[StyleKit colorOfBaseBackground]];
    
    UIButton *btnRefresh = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
    btnRefresh.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [btnRefresh setImage:[UIImage imageNamed:@"refresh_b.png"] forState:UIControlStateNormal];
    [btnRefresh setImage:[UIImage imageNamed:@"refresh_f.png"] forState:UIControlStateHighlighted];
    [btnRefresh addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventTouchUpInside];
    [self setRightButton:btnRefresh pMarginRight:10];
    
    _textField = [[PlusTextField alloc]initWithFrame:CGRectMake(SPACE_BASIC, [self getStartOffsetY] + 10, self.view.frame.size.width-SPACE_BASIC-10, 42)];
    [self.view addSubview:_textField];
    _textField.clearButtonMode = UITextFieldViewModeAlways;
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.delegate = self;
    _textField.placeholder = @"请输入客户经理姓名模糊搜索";
    [_textField addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];

    float oY = _textField.frame.origin.y + _textField.frame.size.height + 10;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(SPACE_BASIC, oY, self.view.frame.size.width-SPACE_BASIC-10, self.view.frame.size.height - oY)];
    [_tableView setBackgroundColor:[UIColor clearColor]];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_searchList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
    }
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 5, _tableView.frame.size.width, 75)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [[view layer] setCornerRadius:6.0f];
    [cell.contentView addSubview:view];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake( 10, 5, view.frame.size.width-10, 21)];
    [view addSubview:name];
    [name setBackgroundColor:[UIColor clearColor]];
    name.font = [UIFont systemFontOfSize:17];
    
    UILabel *phone = [[UILabel alloc]initWithFrame:CGRectMake( 10, 26, view.frame.size.width-10, 21)];
    [view addSubview:phone];
    [phone setBackgroundColor:[UIColor clearColor]];
    phone.font = [UIFont systemFontOfSize:17];
    
    UILabel *fs = [[UILabel alloc]initWithFrame:CGRectMake( 10, 47, view.frame.size.width-10, 21)];
    [view addSubview:fs];
    [fs setBackgroundColor:[UIColor clearColor]];
    fs.font = [UIFont systemFontOfSize:17];
    
    UIButton *btn = [UIButton createRedRadius:CGRectMake( view.frame.size.width-80, 10, 70, view.frame.size.height-20)];
    [view addSubview:btn];
    btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [btn setTitle:@"重置Ta的登录密码" forState:UIControlStateNormal];
    btn.tag = 100+indexPath.row;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary *dic = [_searchList objectAtIndex:indexPath.row];
    name.text = [dic objectForKey:@"name"];
    phone.text = [dic objectForKey:@"phone"];
    fs.text = [[dic objectForKey:@"level_s"]intValue]==2?[NSString stringWithFormat:@"%@(分室经理)",[dic objectForKey:@"fs"] ]:[dic objectForKey:@"fs"];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 83;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - UITextfield delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return range.location >= 26 ?NO:YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
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
- (void)textFieldEditChanged:(UITextField *)textField
{
    [self DATA_collator: [textField text] ];
    [_tableView reloadData];
}
#pragma mark - button action
- (void)refreshAction
{
    [_request User_list:@""];
    [SVProgressHUD show];
}

- (void)btnAction:(UIButton *)btn
{
    NSDictionary *dic = [_searchList objectAtIndex: btn.tag-100 ];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"重置登录密码"
                                                        message:[NSString stringWithFormat:@"温馨提示:【重置】后登录密码将默认为123456,确定要重置【%@】的登录密码吗？", [dic objectForKey:@"name"]]
                                                       delegate:self
                                              cancelButtonTitle:@"重置"
                                              otherButtonTitles:@"取消",nil];
    alertView.tag = btn.tag;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    int index = alertView.tag - 100;
    if ( buttonIndex == 0) {
        NSDictionary *dic = [_searchList objectAtIndex: index ];
        [_request Login_newpwd:[dic objectForKey:@"id"]];
        [SVProgressHUD show];
    }
}
#pragma mark - net delegate
- (void)httpRequestFail:(NSString *) err operation:(int)pOperation
{
    [SVProgressHUD dismissWithError: err ];
}
- (void)httpRequesSucess:(NSDictionary *)pDic operation:(int)pOperation
{
    [SVProgressHUD dismiss];
    
    if ( Type_User_list == pOperation ) {
        NSArray *array = [pDic objectForKey:@"data"];
        [_dataList setArray:array];
        [self DATA_collator:@""];
        [_tableView reloadData];
        
        [self.view makeToast:[NSString stringWithFormat:@"相关数据共%d条", array.count]];
    }else{
        [self.view makeToast:@"修改成功！"];
    }
}
@end
