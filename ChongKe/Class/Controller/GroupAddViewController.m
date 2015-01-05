//
//  GroupAddViewController.m
//  ChongKe
//
//  Created by Air on 14/12/21.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "GroupAddViewController.h"
#import "GroupListViewController.h"

@interface GroupAddViewController ()<UITextFieldDelegate, UITextViewDelegate, UIScrollViewDelegate, UIActionSheetDelegate, RequestResultProtocol>
{
    NetRequest *_request;
    NSDictionary *_dic;
    UIScrollView *_scrollView;
    NSMutableArray *_dataLevel;
    
    float _fHeight;
    CGPoint _point;
    BOOL _isScroller;
}
@end

@implementation GroupAddViewController

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

#pragma mark - data init
- (void)DATA_init{
    _request = [[NetRequest alloc]init];
    _request.delegate = self;
    _dataLevel = [[NSMutableArray alloc]initWithObjects:@"正厅以上",@"正厅",@"副厅",@"厅级",@"正处",@"副处",@"处级",@"其它", nil];
    _isScroller = NO;
    _fHeight = 10;
}
#pragma mark - ui init
- (void)UI_init{
    
    UIButton *btnAdd = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 28)];
    btnAdd.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btnAdd setTitle:@"提交" forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    [self setRightButton:btnAdd pMarginRight:0];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake( SPACE_BASIC, [self getStartOffsetY], self.view.frame.size.width-2*SPACE_BASIC, self.view.frame.size.height - [self getStartOffsetY])];
    [_scrollView setBackgroundColor:[UIColor clearColor]];
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
//    [self UI_element_0];
    [self UI_element_1];
    [self UI_element_2];
    [self UI_element_3];
    [self UI_element_4];
    
    _scrollView.contentSize = CGSizeMake( _scrollView.frame.size.width, _fHeight+10);
}
- (void)UI_element_0{
    UIButton *btn = [UIButton createRedRadius:CGRectMake(SPACE_BASIC, _fHeight, _scrollView.frame.size.width-2*SPACE_BASIC, 42)];
    [_scrollView addSubview:btn];
    [btn setTitle:@"查看Ta的消费记录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(expenseCalendarAction) forControlEvents:UIControlEventTouchUpInside];
    
    _fHeight = btn.frame.origin.y + btn.frame.size.height + 10;
}
- (void)UI_element_1{
    float height = 46*3 ;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, _fHeight, _scrollView.frame.size.width, height)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [[view layer] setCornerRadius:6.0f];
    [_scrollView addSubview:view];
    view.tag = 1000+1;
    
    
    _fHeight = view.frame.origin.y + view.frame.size.height + 10;
    
    for (int i = 0; i < 3; i++) {
        if ( i != 0 ) {
            UIImageView *ivLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 46*i, view.frame.size.width, 1)];
            [view addSubview:ivLine];
            [ivLine setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.8]];
        }
        
        UIFont *font = [UIFont boldSystemFontOfSize:17];
        NSLineBreakMode lineBreakMode = NSLineBreakByCharWrapping;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 46*i, view.frame.size.width-10, 46)];
        label.font = font;
        label.lineBreakMode = lineBreakMode;
        label.backgroundColor = [UIColor clearColor];
        [view addSubview:label];
        
        NSArray *arrName = [NSArray arrayWithObjects:@"集团名称", @"集团编码", @"分室",nil];
        NSString *strName = [arrName objectAtIndex:i];
        label.text = strName;
        
        PlusTextField *textField = [[PlusTextField alloc]initWithFrame:CGRectMake(85, 46*i, view.frame.size.width-90, 46)];
        textField.placeholder = @"请输入";
        textField.textAlignment = NSTextAlignmentRight;
        [view addSubview:textField];
        textField.userInteractionEnabled = NO;
        textField.textColor = [UIColor colorWithWhite:0.6 alpha:1];
        textField.delegate = self;
        textField.tag = 100 + i;
        
        if ( 2 == i  ) {
            textField.frame = CGRectMake(5, 46*i, _scrollView.frame.size.width-10, 46);
            textField.userInteractionEnabled = YES;
            label.textAlignment = NSTextAlignmentRight;
            CGSize size = [strName sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, 46) lineBreakMode:lineBreakMode];
            
            UILabel *start = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.size.width+label.frame.origin.x-size.width-5, 46*i+6, 30, 46)];
            [start setBackgroundColor:[UIColor clearColor]];
            [start setTextColor:[UIColor redColor]];
            [start setFont:font];
            [start setText:@"*"];
            [view addSubview:start];
            
            textField.textAlignment = NSTextAlignmentLeft;
        }
        
        switch ( i ) {
            case 0:
                textField.text = [_dic objectForKey:@"ename"];
                break;
            case 1:
                textField.text = [_dic objectForKey:@"ecode"];
                break;
            default:
                textField.text = [_dic objectForKey:@"fs"];
                break;
        }
        
    }
}
- (void)UI_element_2{
    float height = 46*10;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, _fHeight, _scrollView.frame.size.width, height)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [[view layer] setCornerRadius:6.0f];
    [_scrollView addSubview:view];
    view.tag = 1000+2;
    
    _fHeight = view.frame.origin.y + view.frame.size.height + 10;
    
    NSArray *arrName = [NSArray arrayWithObjects:@"姓名", @"职务", @"级别", @"移动手机号码", @"联通号码", @"电信号码", @"集团客户经理", @"部门", @"个人喜好", @"终端机型",nil];
    
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
        
        PlusTextField *textField = [[PlusTextField alloc]initWithFrame:CGRectMake(5, 46*i, view.frame.size.width-10, 46)];
        textField.placeholder = @"请输入";
        [view addSubview:textField];
        textField.textColor = [UIColor colorWithWhite:0.6 alpha:1];
        textField.tag = 100 + i;
        textField.delegate = self;
        
        if ( 3 == i || 4 == i || 5 == i) {
            textField.keyboardType = UIKeyboardTypePhonePad;
        }
        
        if ( 0==i || 1 == i || 2 == i ||  3 == i || 6== i|| 7== i ) {
            CGSize size = [strName sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, 46) lineBreakMode:lineBreakMode];
            label.text = strName;
            
            UILabel *start = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.size.width+label.frame.origin.x-size.width-5, 46*i+6, 30, 46)];
            [start setBackgroundColor:[UIColor clearColor]];
            [start setTextColor:[UIColor redColor]];
            [start setFont:font];
            [start setText:@"*"];
            [view addSubview:start];
        }
        if ( 2 == i) {
            
            UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake( 0, 46*i+20, 10, 10)];
            [view addSubview:arrow];
            [arrow setImage:[UIImage imageNamed:@"arrow_icon.png"]];
            
            textField.frame = CGRectMake(13, 46*i, view.frame.size.width-18, 46);
            textField.userInteractionEnabled = NO;
            
            UIButton *btn = [[UIButton alloc]initWithFrame:textField.frame];
            [view addSubview:btn];
            [btn setBackgroundColor:[UIColor clearColor]];
            [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        }
        
        switch ( i ) {
            case 0:
                textField.text = [_dic objectForKey:@"gname"];
            break;
            case 1:
                textField.text = [_dic objectForKey:@"job"];
            break;
            case 2:
//                textField.text =  [_dataLevel objectAtIndex: [[_dic objectForKey:@"level_s"] intValue]-1];
            break;
            case 3:
                textField.text = [_dic objectForKey:@"yd"];
            break;
            case 4:
                textField.text = [_dic objectForKey:@"lt"];
            break;
            case 5:
                textField.text = [_dic objectForKey:@"dx"];
            break;
            case 6:
                textField.text = [_dic objectForKey:@"khjl"];
            break;
            case 7:
                textField.text = [_dic objectForKey:@"dept"];
            break;
            case 8:
                textField.text = [_dic objectForKey:@"interest"];
            break;
        }
        
    }
}
- (void)UI_element_3{
    float height = 36;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _fHeight, _scrollView.frame.size.width, height)];
    label.text = @"主要负责工作";
    label.font = [UIFont boldSystemFontOfSize:17];
    label.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:label];
    
    _fHeight = label.frame.origin.y + label.frame.size.height ;
}
- (void)UI_element_4{
    float height = 90;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, _fHeight, _scrollView.frame.size.width, height)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [[view layer] setCornerRadius:6.0f];
    [_scrollView addSubview:view];
    view.tag = 1000+3;
    
    _fHeight = view.frame.origin.y + view.frame.size.height + 10;
    
    UITextView *textView = [[UITextView alloc]initWithFrame:view.bounds];
    [view addSubview:textView];
    textView.delegate = self;
    textView.tag = 100 + 0;
}

#pragma mark - textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _point = _scrollView.contentOffset;
    float hight = textField.frame.origin.y + textField.superview.frame.origin.y;
    hight = hight>60? hight-60: hight;
    
    _isScroller = NO;
    [UIView animateWithDuration:0.3
                     animations:^(void){
                         [_scrollView setContentOffset:CGPointMake(0, hight)];
                     }
                     completion:^(BOOL finished){
                         _isScroller = YES;
                     }];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [_scrollView setContentOffset:_point animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ( [textField superview].tag == 102) {
        return YES;
    }
    return range.location >= 26 ?NO:YES;
}
#pragma mark - textview delegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    _point = _scrollView.contentOffset;
    float hight = textView.frame.origin.y + textView.superview.frame.origin.y;
    hight = hight>60? hight-60: hight;
    
    _isScroller = NO;
    [UIView animateWithDuration:0.3
                     animations:^(void){
                         [_scrollView setContentOffset:CGPointMake(0, hight)];
                     }
                     completion:^(BOOL finished){
                         _isScroller = YES;
                     }];
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    [_scrollView setContentOffset:_point animated:YES];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){
        [self.view endEditing:YES];
        return NO;
    }
    
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ( _isScroller ) [self.view endEditing:YES];
}

#pragma mark - sheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( 0 == buttonIndex) {
        return;
    }
    
    UIView *view = [_scrollView viewWithTag:1002];
    UITextField *textField = (UITextField *)[view viewWithTag:102];
    textField.text = [_dataLevel objectAtIndex:buttonIndex-1];
}

#pragma mark - button action
- (void)btnAction
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:nil];
    
    for (int idx = 0; idx < _dataLevel.count; idx++) {
        [actionSheet addButtonWithTitle:[_dataLevel objectAtIndex:idx]];
    }
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}

- (void)submitAction
{
    //检测必填项
    UITextField *textField;
    
    textField = (UITextField *)[[_scrollView viewWithTag:1001] viewWithTag:100];
    NSString *ename = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1001] viewWithTag:101];
    NSString *ecode = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1001] viewWithTag:102];
    NSString *fs = textField.text;
    
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:100];
    NSString *gname = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:101];
    NSString *job = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:102];
    int level_s = [_dataLevel indexOfObject: textField.text ]+1;
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:103];
    NSString *yd = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:104];
    NSString *lt = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:105];
    NSString *dx = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:106];
    NSString *khjl = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:107];
    NSString *dept = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:108];
    NSString *interest = textField.text;
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:109];
    NSString *client = textField.text;
    
    UITextView *textView = (UITextView *)[[_scrollView viewWithTag:1003] viewWithTag:100];
    NSString *work = textView.text;
    
    textField = (UITextField *)[[_scrollView viewWithTag:1002] viewWithTag:102];
    NSString *jb = textField.text;
    
    if ( fs.length * job.length * gname.length * jb.length * yd.length * khjl.length * dept.length<= 0 ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"还有必填项未填写！"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    [_request Group_add:ecode ename:ename gname:gname dept:dept level_s:level_s job:job yd:yd lt:lt dx:dx interest:interest work:work khjl:khjl fs:fs client:client];
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
    
    GroupListViewController *vc = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    vc.mIsRefresh = YES;
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end