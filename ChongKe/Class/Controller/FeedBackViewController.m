//
//  FeedBackViewController.m
//  ChongKe
//
//  Created by Lys on 14/12/20.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "FeedBackViewController.h"

#define Title_Home @"请留下您宝贵的建议或意见，我们会更加努力的!"

@interface FeedBackViewController ()<UITextViewDelegate,RequestResultProtocol>
{
    NetRequest *_request;
    UITextView *_textView;
}
@end

@implementation FeedBackViewController

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
    
    UIButton *btnAdd = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 28)];
    btnAdd.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [btnAdd setTitle:@"发送" forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    [self setRightButton:btnAdd pMarginRight:0];
    
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(5, [self getStartOffsetY]+10, self.view.frame.size.width-10, 200)];
    [bgView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:bgView];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:bgView.bounds];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.userInteractionEnabled = NO;
    [bgView addSubview:textField];
    
    _textView = [[UITextView alloc]initWithFrame:bgView.bounds];
    [bgView addSubview:_textView];
    _textView.delegate = self;
    [_textView becomeFirstResponder];
    _textView.text = Title_Home;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [super touchesEnded:touches withEvent:event];
}

#pragma mark - textview delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){
        [self.view endEditing:YES];
        return NO;
    }
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ( [textView.text isEqualToString:Title_Home] ) {
        textView.text = @"";
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ( textView.text.length <= 0 ) {
        textView.text = Title_Home;
    }
}

#pragma mark - button action
- (void)submitAction
{
    if ( _textView.text.length <= 0 || [_textView.text isEqualToString: Title_Home ] ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"请输入您的建议或意见后再发送!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    NSString *client = [NSString stringWithFormat:@"%@-I_V%@", [NSString getCurrentDeviceModel],[[[NSBundle mainBundle] infoDictionary]  objectForKey:@"CFBundleShortVersionString"]];
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    NSString *name = [ud objectForKey:@"name"];
    NSString *phone = [ud objectForKey:@"phone"];
    
    [_request Feedback_add:_textView.text client:client uname: name phone: phone ];
    [SVProgressHUD show];
}
#pragma mark - net delegate
- (void)httpRequestFail:(NSString *) err operation:(int)pOperation
{
    [SVProgressHUD dismissWithError: err ];
}
- (void)httpRequesSucess:(NSDictionary *)pDic operation:(int)pOperation
{
    [SVProgressHUD dismissWithSuccess:@"发送成功，感谢您宝贵的意见!"];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
