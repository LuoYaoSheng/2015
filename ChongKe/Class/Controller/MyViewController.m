//
//  MyViewController.m
//  MShops
//
//  Created by Air on 14/12/14.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "MyViewController.h"
#import "GroupListViewController.h"

@interface MyViewController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, RequestResultProtocol>
{
    NetRequest *_request;
    NSMutableArray *_dataList;
    NSMutableArray *_searchList;
    
    PlusTextField *_textField;
    UITableView *_tableView;
}
@end

@implementation MyViewController

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
        
        NSString *name = [dic objectForKey:@"ename"];
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
    _textField.placeholder = @"请输入集团名称模糊搜索";
    
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
    
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake( view.frame.size.width-20, (view.frame.size.height-20)*0.5, 12, 20)];
    [view addSubview:arrow];
    [arrow setImage:[UIImage imageNamed:@"arrow_icon_gray.png"]];
    
    UILabel *tel = [[UILabel alloc]initWithFrame:CGRectMake( view.frame.size.width-125, 16, 100, 21)];
    [view addSubview:tel];
    [tel setBackgroundColor:[UIColor clearColor]];
    tel.font = [UIFont systemFontOfSize:17];
    tel.textAlignment = NSTextAlignmentRight;
    
    UILabel *group = [[UILabel alloc]initWithFrame:CGRectMake( 8, 16, view.frame.size.width-125-10, 21)];
    [view addSubview:group];
    [group setBackgroundColor:[UIColor clearColor]];
    group.font = [UIFont boldSystemFontOfSize:19];
    
    UILabel *company = [[UILabel alloc]initWithFrame:CGRectMake( view.frame.size.width-125, 41, 100, 21)];
    [view addSubview:company];
    [company setBackgroundColor:[UIColor clearColor]];
    company.font = [UIFont systemFontOfSize:17];
    company.textColor = [UIColor grayColor];
    company.textAlignment = NSTextAlignmentRight;
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake( 8, 41, view.frame.size.width-125-10, 21)];
    [view addSubview:name];
    [name setBackgroundColor:[UIColor clearColor]];
    name.font = [UIFont systemFontOfSize:17];
    name.textColor = [UIColor grayColor];
    
    NSDictionary *dic = [_searchList objectAtIndex:indexPath.row];
    tel.text = [dic objectForKey:@"ecode"];
    group.text = [dic objectForKey:@"ename"];
    company.text = [dic objectForKey:@"fs"];
    name.text = [dic objectForKey:@"khjl"];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dic = [_searchList objectAtIndex:indexPath.row];
    GroupListViewController *controller = [[GroupListViewController alloc]initWithDic:dic];
    controller.title = @"集团领导";
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_TO_CONTROLLER object:controller];
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
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    int level_s = [[ud objectForKey:@"level_s"]intValue];
    NSString *fs = [ud objectForKey:@"fs"];
    NSString *name = [ud objectForKey:@"name"];
    
    [_request Group_search:@"" level_s:level_s fs:fs name:name];
    [SVProgressHUD show];
}

#pragma mark - net delegate
- (void)httpRequestFail:(NSString *) err operation:(int)pOperation
{
    [SVProgressHUD dismissWithError: err ];
}
- (void)httpRequesSucess:(NSDictionary *)pDic operation:(int)pOperation
{
    [SVProgressHUD dismiss];
    NSArray *array = [pDic objectForKey:@"data"];
    [_dataList setArray:array];
    [self DATA_collator:@""];
    [_tableView reloadData];
    
    [self.view makeToast:[NSString stringWithFormat:@"相关数据共%d条", array.count]];
}
@end
