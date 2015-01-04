//
//  GroupListViewController.m
//  ChongKe
//
//  Created by Air on 14/12/21.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "GroupListViewController.h"
#import "GroupAddViewController.h"
#import "GroupDetailsViewController.h"


@interface GroupListViewController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, RequestResultProtocol>
{
    NetRequest *_request;
    NSMutableArray *_dataList;
    NSMutableArray *_searchList;
    NSDictionary *_dic;
    
    PlusTextField *_textField;
    UITableView *_tableView;
    UIButton *_btnEcode;
    NSMutableArray *_ecodeList;
    NSMutableArray *_enameList;
}

@end

@implementation GroupListViewController

- (id)initWithDic:(NSDictionary *)pDic
{
    self = [super init];
    if (self) {
        _dic = [[NSDictionary alloc]initWithDictionary:pDic];
    }
    return self;
}

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
    if ( _mIsRefresh ) {
        [_request Group_list:[_dic objectForKey:@"ecode"]];
        [SVProgressHUD show];
    }
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
    _ecodeList = [[NSMutableArray alloc]init];
    _enameList = [[NSMutableArray alloc]init];
    [_ecodeList addObject:[_dic objectForKey:@"ecode"]];
    [_enameList addObject:@"全部"];
    _searchList = [[NSMutableArray alloc]init];
    
    _mIsRefresh = YES;
}

- (void)DATA_collator:(NSString *)text
{
    [_searchList removeAllObjects];
    for (NSDictionary *dic in _dataList) {
        
        NSString *name = [dic objectForKey:@"dept"];
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

    UIButton *btnAdd = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 28)];
    btnAdd.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btnAdd setTitle:@"添加领导" forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    [self setRightButton:btnAdd pMarginRight:0];
    
    
    UILabel *hello = [[UILabel alloc]initWithFrame:CGRectMake(0, [self getStartOffsetY], self.view.frame.size.width, 42)];
    [self.view addSubview:hello];
    [hello setBackgroundColor:[UIColor clearColor]];
    hello.textAlignment = NSTextAlignmentCenter;
    hello.font = [UIFont boldSystemFontOfSize:17];
    hello.textColor = [StyleKit colorOfGreen];
    hello.text = [_dic objectForKey:@"ename"];
    
    
    float height = hello.frame.origin.y + hello.frame.size.height + 10;
    
    _textField = [[PlusTextField alloc]initWithFrame:CGRectMake(SPACE_BASIC, height, self.view.frame.size.width-SPACE_BASIC-100, 42)];
    [self.view addSubview:_textField];
    _textField.clearButtonMode = UITextFieldViewModeAlways;
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.delegate = self;
    _textField.placeholder = @"请输入领导姓名模糊搜索";
    [_textField addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    
    _btnEcode = [UIButton createRedRadius:CGRectMake( self.view.frame.size.width-90, height, 80, 42)];
    [self.view addSubview:_btnEcode];
    [_btnEcode setTitle:@"全  部" forState:UIControlStateNormal];
    [_btnEcode addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 5, _tableView.frame.size.width, 100)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [[view layer] setCornerRadius:6.0f];
    [cell.contentView addSubview:view];
    
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake( view.frame.size.width-20, (view.frame.size.height-20)*0.5, 12, 20)];
    [view addSubview:arrow];
    [arrow setImage:[UIImage imageNamed:@"arrow_icon_gray.png"]];
    
    UILabel *level_c = [[UILabel alloc]initWithFrame:CGRectMake( view.frame.size.width-125, 16, 100, 21)];
    [view addSubview:level_c];
    [level_c setBackgroundColor:[UIColor clearColor]];
    level_c.font = [UIFont boldSystemFontOfSize:19];
    level_c.textAlignment = NSTextAlignmentRight;
    
    UILabel *dept = [[UILabel alloc]initWithFrame:CGRectMake( 8, 16, view.frame.size.width-125-10, 21)];
    [view addSubview:dept];
    [dept setBackgroundColor:[UIColor clearColor]];
    dept.font = [UIFont boldSystemFontOfSize:19];
    
    UILabel *job = [[UILabel alloc]initWithFrame:CGRectMake( 8, 41, view.frame.size.width-125-10, 21)];
    [view addSubview:job];
    [job setBackgroundColor:[UIColor clearColor]];
    job.font = [UIFont systemFontOfSize:17];
    job.textColor = [UIColor grayColor];
    
    UILabel *yd = [[UILabel alloc]initWithFrame:CGRectMake( view.frame.size.width-145, 66, 120, 21)];
    [view addSubview:yd];
    [yd setBackgroundColor:[UIColor clearColor]];
    yd.font = [UIFont systemFontOfSize:17];
    yd.textColor = [UIColor grayColor];
    yd.textAlignment = NSTextAlignmentRight;
    
    UILabel *gname = [[UILabel alloc]initWithFrame:CGRectMake( 8, 66, view.frame.size.width-125-10, 21)];
    [view addSubview:gname];
    [gname setBackgroundColor:[UIColor clearColor]];
    gname.font = [UIFont systemFontOfSize:17];
    gname.textColor = [UIColor grayColor];

    NSDictionary *dic = [_searchList objectAtIndex:indexPath.row];

    NSArray *dataLevel = [NSArray arrayWithObjects:@"正厅以上",@"正厅",@"副厅",@"厅级",@"正处",@"副处",@"处级",@"其它", nil];
    int level_s = [[dic objectForKey:@"level_s"] intValue] - 1;
    
    NSString *sJob = [dic objectForKey:@"job"];
    sJob = sJob.length <= 0 ? @"请编辑更新":sJob;
    NSString *sDept = [dic objectForKey:@"dept"];
    sDept = sDept.length <= 0 ? @"请编辑更新":sDept;
    NSString *sGname = [dic objectForKey:@"gname"];
    sGname = sGname.length <= 0 ? @"请编辑更新":sGname;
    
    level_c.text =  level_s < 0 ?@"": [dataLevel objectAtIndex: level_s ];
    dept.text = sDept;
    job.text = sJob;
    yd.text = [dic objectForKey:@"yd"];
    gname.text = sGname;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _mIsRefresh = NO;
    NSDictionary *dic = [_dataList objectAtIndex:indexPath.row];
    GroupDetailsViewController *controller = [[GroupDetailsViewController alloc]initWithDic:dic];
    controller.title = @"详情";
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
#pragma mark - sheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( 0 == buttonIndex) {
        return;
    }
    [_request Group_list:[_ecodeList objectAtIndex:buttonIndex-1]];
    [SVProgressHUD show];
}
#pragma mark - button action
- (void)searchAction
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:nil];
    
    for (int idx = 0; idx < _enameList.count; idx++) {
        [actionSheet addButtonWithTitle:[_enameList objectAtIndex:idx]];
    }
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}

- (void)addAction
{
    _mIsRefresh = NO;
    GroupAddViewController *controller = [[GroupAddViewController alloc]initWithDic:_dic];
    controller.title = @"添加领导";
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_TO_CONTROLLER object:controller];
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
    
    [_ecodeList removeAllObjects];
    [_enameList removeAllObjects];
    [_ecodeList addObject:[_dic objectForKey:@"ecode"]];
    [_enameList addObject:@"全部"];
    
    for (NSDictionary *dic in _dataList) {

        if ( [_ecodeList indexOfObject:[dic objectForKey:@"ecode"]] < _ecodeList.count || [[dic objectForKey:@"dept"] length] <= 0 ) {
            break;
        }
        
        [_ecodeList addObject:[dic objectForKey:@"ecode"]];
        [_enameList addObject:[dic objectForKey:@"dept"]];
    }
}
@end