//
//  ExpenseCalendarViewController.m
//  ChongKe
//
//  Created by Air on 14/12/21.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "ExpenseCalendarViewController.h"

@interface ExpenseCalendarViewController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, RequestResultProtocol>
{
    NetRequest *_request;
    
    UITableView *_tableView;
    UIButton *_btnTop[3];
    UILabel *_lTop[3];
    NSString *_tel;
    NSUInteger _month;
    NSUInteger _year;
    int _index;
    NSMutableArray *_dataList;
}
@end

@implementation ExpenseCalendarViewController

- (id)initWithTel:(NSString *)pTel
{
    self = [super init];
    if (self) {
        _tel = [[NSString alloc]initWithString:pTel];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self DATA_init];
    [self UI_init];

//    [_request Report:_tel ny:_lTop[_index].text];
    [_request NewReport:_tel ny:_lTop[_index].text];
    [SVProgressHUD show];
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
    _index = 0;
    _dataList = [[NSMutableArray alloc]init];
    
    NSDate * startDate = [[NSDate alloc] init];
    NSCalendar * chineseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit |
    NSSecondCalendarUnit | NSDayCalendarUnit  |
    NSMonthCalendarUnit | NSYearCalendarUnit;
    
    NSDateComponents * cps = [chineseCalendar components:unitFlags fromDate:startDate];
//    NSUInteger hour = [cps hour];
//    NSUInteger minute = [cps minute];
//    NSUInteger second = [cps second];
//    NSUInteger day = [cps day];
    _month = [cps month];
    _year = [cps year];

}

#pragma mark - ui init
- (void)UI_init
{
    
    UIButton *btnRefresh = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
    btnRefresh.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [btnRefresh setImage:[UIImage imageNamed:@"refresh_b.png"] forState:UIControlStateNormal];
    [btnRefresh setImage:[UIImage imageNamed:@"refresh_f.png"] forState:UIControlStateHighlighted];
    [btnRefresh addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventTouchUpInside];
    [self setRightButton:btnRefresh pMarginRight:10];
    
    UIView *vTop = [[UIView alloc]initWithFrame:CGRectMake(0, [self getStartOffsetY], self.view.frame.size.width, 64)];
    [vTop setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:vTop];
    
    float width = vTop.frame.size.width / 3;
    for (int idx = 0; idx < 3; idx++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(width*idx, 0, width, vTop.frame.size.height)];
        [view setBackgroundColor:[UIColor clearColor]];
        [vTop addSubview:view];
        
        _btnTop[ idx ] = [[UIButton alloc]initWithFrame:CGRectMake(5, (view.frame.size.height-26)*0.5, 26, 26)];
        [view addSubview:_btnTop[ idx ]];
        _btnTop[ idx ].tag = 100 + idx;
        [_btnTop[ idx ] addTarget:self action:@selector(btnSelect:) forControlEvents:UIControlEventTouchUpInside];
        [_btnTop[ idx ] setImage:[UIImage imageNamed:@"s_raido_checked.png"] forState:UIControlStateNormal];
        [_btnTop[ idx ] setImage:[UIImage imageNamed:@"s_raido_checked_f.png"] forState:UIControlStateHighlighted];
        [_btnTop[ idx ] setImage:[UIImage imageNamed:@"s_raido_checked_f.png"] forState:UIControlStateSelected];
        
        float f = _btnTop[ idx ].frame.origin.x+_btnTop[ idx ].frame.size.width+3;
        _lTop[ idx ] = [[UILabel alloc]initWithFrame:CGRectMake( f, 0, view.frame.size.width-f, view.frame.size.height)];
        [view addSubview:_lTop[ idx ]];
        [_lTop[ idx ] setBackgroundColor:[UIColor clearColor]];
        _lTop[ idx ].textColor = [UIColor colorWithRed:174/255.0 green:54/255.0 blue:75/255.0 alpha:1];
        _lTop[ idx ].numberOfLines = 0;
        
        int month = _month - idx;
        int year = _year;
        if ( month <= 0) {
            month = 12 - idx + 1;
            year -= 1;
        }
        _lTop[ idx ].text = [NSString stringWithFormat:@"%4d%02d",year,month];
    }
    
    [_btnTop[ _index ] setSelected:YES];
    
    
    float height = vTop.frame.origin.y + vTop.frame.size.height ;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(SPACE_BASIC, height, self.view.frame.size.width-SPACE_BASIC-10, self.view.frame.size.height -height)];
    [_tableView setBackgroundColor:[UIColor clearColor]];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    float height = 0;
    int count = 0;
    NSMutableArray *array;
    NSMutableArray *keys;
    
    if ( indexPath.row % 2 == 0) {
        height = 36;
    }else{
        int idx = indexPath.row / 2;
        switch ( idx ) {
            case 0:
            {
                height = 46*4;
                count = 4;
                array = [NSMutableArray arrayWithObjects: @"集团编号", @"集团名称", @"集团客户经理", @"价值等级", nil];
                keys = [NSMutableArray arrayWithObjects:@"ecode", @"ename", @"jtkhjl", @"jzdj", nil];
            }
                break;
                
            case 1:
            {
                height = 46*4;
                count = 4;
                array = [NSMutableArray arrayWithObjects:@"成员类型",  @"用户品牌", @"用户状态", @"是否160包干", nil];
                keys = [NSMutableArray arrayWithObjects:@"cylx", @"yhpb", @"yhzt",@"sfbg", nil];
            }
                break;
                
            case 2:
            {
                height = 46*14;
                count = 14;
                array = [NSMutableArray arrayWithObjects:@"是否综合捆绑",@"是否硬捆绑", @"硬捆绑到期时长(月)", @"是否预存话费捆绑", @"预存捆绑到期时长(月)", @"是否保底优费捆绑", @"保底优惠捆绑到期时长(月)", @"是否银行托收", @"是否银行代扣", @"是否集团统付捆绑", @"是否终端捆绑", @"终端捆绑到期时长(月)", @"是否软捆绑",@"是否订购集团V网", nil];
                keys = [NSMutableArray arrayWithObjects:@"sfzhkb",@"sfykb", @"ykbdq", @"sfyc", @"ycdq", @"sfbd", @"bdyhdq", @"sfyhts", @"sfyhdk", @"sfjttf", @"sfzdkb", @"zdkbdq", @"sfrkb",@"sfdgv", nil];

            }
                break;
                
            default:
            {
                height = 46*6;
                count = 6;
                array = [NSMutableArray arrayWithObjects:@"营销保底最高金额(元)", @"集团统付出账金额(元)",@"当月主叫MOU(分钟)",@"上月主叫MOU(分钟)",@"当月DOU(元)",@"ARPU(元)", nil];
                keys = [NSMutableArray arrayWithObjects:@"yxbd", @"jttf", @"dymou",@"symou",@"dydou",@"dyarpu", nil];
            }
                break;
        }
    }
    
    if ( indexPath.row % 2 == 0) {
        NSArray *array = [NSArray arrayWithObjects:@"集团基本信息", @"成员基本信息", @"成员硬捆绑信息", @"成员软捆绑信息", @"成员消费信息", nil];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, height)];
        label.text = [array objectAtIndex:indexPath.row/2];
        label.font = [UIFont boldSystemFontOfSize:17];
        label.textColor = [UIColor colorWithRed:174/255.0 green:54/255.0 blue:75/255.0 alpha:1];
        label.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label];
    }else{
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 5, _tableView.frame.size.width, height)];
        [view setBackgroundColor:[UIColor whiteColor]];
        [[view layer] setCornerRadius:6.0f];
        [cell.contentView addSubview:view];

        for (int i = 0; i < array.count; i++) {
            if ( i != 0 ) {
                UIImageView *ivLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 46*i, view.frame.size.width, 1)];
                [view addSubview:ivLine];
                [ivLine setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.8]];
            }
            
            UIFont *font = [UIFont boldSystemFontOfSize:17];
            NSLineBreakMode lineBreakMode = NSLineBreakByCharWrapping;
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 46*i, _tableView.frame.size.width-10, 46)];
            label.font = font;
            label.lineBreakMode = lineBreakMode;
            label.backgroundColor = [UIColor clearColor];
            [view addSubview:label];
            
            label.text = [array objectAtIndex:i];

            PlusTextField *textField = [[PlusTextField alloc]initWithFrame:CGRectMake(85, 46*i, _tableView.frame.size.width-90, 46)];
            textField.textAlignment = NSTextAlignmentRight;
            [view addSubview:textField];
            textField.userInteractionEnabled = NO;
            textField.textColor = [UIColor colorWithWhite:0.6 alpha:1];
            textField.delegate = self;
            
            NSDictionary *dic = _dataList.count > 0 ?[_dataList lastObject]:NULL;
            textField.text = dic!=NULL?[dic objectForKey:[keys objectAtIndex:i]]:@"";
        }
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = 0;
    
    if ( indexPath.row % 2 == 0) {
        height = 36;
    }else{
        int idx = indexPath.row / 2;
        
        switch ( idx ) {
            case 0:
                height = 46*4+10;
                break;
                
            case 1:
                height = 46*4+10;
                break;
                
            case 2:
                height = 46*14+10;
                break;
                
            default:
                height = 46*6+10;
                break;
        }
    }
    
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - button action
- (void)refreshAction
{
    [_request NewReport:_tel ny:_lTop[_index].text];
    [SVProgressHUD show];
}

- (void)btnSelect:(UIButton *)btn
{
    if ( btn.isSelected ) {
        return;
    }
    _index = btn.tag - 100;
    if ( !btn.isSelected ) {
        for (int idx = 0; idx < 3; idx++) {
            [_btnTop[ idx ] setSelected:NO];
        }
    }
    [btn setSelected:YES];
    
    [_request NewReport:_tel ny:_lTop[_index].text];
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
    [_dataList removeAllObjects];
    [_dataList addObjectsFromArray:[pDic objectForKey:@"data"]];
    [_tableView reloadData];
}

@end