//
//  LLLockViewController.m
//  MShops
//
//  Created by Air on 14/12/13.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "LLLockViewController.h"
#import "LLLockIndicator.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

#define kTipColorNormal [UIColor blackColor]
#define kTipColorError [UIColor redColor]


@interface LLLockViewController ()
{
    int nRetryTimesRemain; // 剩余几次输入机会
}

@property (nonatomic, strong)  UIImageView *preSnapImageView; // 上一界面截图
@property (nonatomic, strong)  UIImageView *currentSnapImageView; // 当前界面截图
//@property (nonatomic, strong)  LLLockIndicator* indecator; // 九点指示图
@property (nonatomic, strong)  LLLockView* lockview; // 触摸田字控件
@property (nonatomic, strong)  UILabel *tipLable;
@property (nonatomic, strong)  UIButton *tipButton; // 重设/(取消)的提示按钮

@property (nonatomic, strong) NSString* savedPassword; // 本地存储的密码
@property (nonatomic, strong) NSString* passwordOld; // 旧密码
@property (nonatomic, strong) NSString* passwordNew; // 新密码
@property (nonatomic, strong) NSString* passwordconfirm; // 确认密码
@property (nonatomic, strong) NSString* tip1; // 三步提示语
@property (nonatomic, strong) NSString* tip2;
@property (nonatomic, strong) NSString* tip3;

@property (nonatomic, strong) UIButton *btnQuit;

@end


@implementation LLLockViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithType:(LLLockViewType)type
{
    self = [super init];
    if (self) {
        _nLockViewType = type;
    }
    return self;
}

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self UI_init];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.indecator.backgroundColor = [UIColor clearColor];
    self.lockview.backgroundColor = [UIColor clearColor];
    
    //    self.horiScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 320, 320)];
    
    self.lockview.delegate = self;
    
    LLLog(@"实例化了一个LockVC");
}

- (void)viewWillAppear:(BOOL)animated
{
#ifdef LLLockAnimationOn
    [self capturePreSnap];
#endif
    
    [super viewWillAppear:animated];
    _btnQuit.hidden = YES;
    // 初始化内容
    switch (_nLockViewType) {
        case LLLockViewTypeCheck:
        {
            [SVProgressHUD dismissWithSuccess: @"请输入解锁密码" ];
            _tipLable.text = @"请输入解锁密码";
            _btnQuit.hidden = NO;
        }
            break;
        case LLLockViewTypeCreate:
        {
            [SVProgressHUD dismissWithSuccess: @"创建手势密码" ];
            _tipLable.text = @"创建手势密码";
        }
            break;
        case LLLockViewTypeModify:
        {
            [SVProgressHUD dismissWithSuccess: @"请输入原来的密码" ];
            _tipLable.text = @"请输入原来的密码";
        }
            break;
        case LLLockViewTypeClean:
        default:
        {
            [SVProgressHUD dismissWithSuccess: @"请输入密码以清除密码" ];
            _tipLable.text = @"请输入密码以清除密码";
        }
    }
    
    // 尝试机会
    nRetryTimesRemain = LLLockRetryTimes;
    
    self.passwordOld = @"";
    self.passwordNew = @"";
    self.passwordconfirm = @"";
    
    // 本地保存的手势密码
    self.savedPassword = [LLLockPassword loadLockPassword];
    LLLog(@"本地保存的密码是%@", self.savedPassword);
    
    [self updateTipButtonStatus];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)UI_init
{
    
    UIImageView *iv_logo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 272, 88)];
    [self.view addSubview:iv_logo];
    [iv_logo setImage:[UIImage imageNamed:@"iv_logo.9.png"]];
    
    _preSnapImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];// 上一界面截图
    [self.view addSubview:_preSnapImageView];
    
    _currentSnapImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];// 当前界面截图
    [self.view addSubview:_currentSnapImageView];
    
//    _indecator = [[LLLockIndicator alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];// 九点指示图
//    [self.view addSubview:_indecator];
    
    _lockview = [[LLLockView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];// 触摸田字控件
    [self.view addSubview:_lockview];
    _lockview.center = CGPointMake(self.view.center.x, self.view.center.y+30);
    
    
//    _tipLable = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-30, self.view.frame.size.width, 21)];
    _tipLable = [[UILabel alloc]init];
    [_tipLable setBackgroundColor:[UIColor clearColor]];
    _tipLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_tipLable];

    _tipButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];// 重设/(取消)的提示按钮
    [_tipButton addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_tipButton];
    
    
    iv_logo.center = CGPointMake(self.view.center.x, _lockview.frame.origin.y - iv_logo.frame.size.height*0.5 + 30);
    
    
    _btnQuit = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.5, self.view.frame.size.height-46, self.view.frame.size.width*0.5, 46)];
    [self.view addSubview:_btnQuit];
    _btnQuit.titleLabel.font = [UIFont systemFontOfSize:14];
    [_btnQuit setBackgroundColor:[UIColor clearColor]];
    [_btnQuit setTitle:@"忘记图形密码,点这里" forState:UIControlStateNormal];
    [_btnQuit setTitleColor:[StyleKit colorOfBaseDeep] forState:UIControlStateNormal];
    [_btnQuit addTarget:self action:@selector(quitAction) forControlEvents:UIControlEventTouchUpInside];
    _btnQuit.hidden = YES;
//
//    UIButton *btnNext = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.5, self.view.frame.size.height-46, self.view.frame.size.width*0.5, 46)];
//    [self.view addSubview:btnNext];
//    [btnNext setBackgroundColor:[UIColor greenColor]];
//    [btnNext setTitle:@"下一步" forState:UIControlStateNormal];
}

#pragma mark - 检查/更新密码
- (void)checkPassword:(NSString*)string
{
    // 验证密码正确
    if ([string isEqualToString:self.savedPassword]) {
        
        if (_nLockViewType == LLLockViewTypeModify) { // 验证旧密码
            
            self.passwordOld = string; // 设置旧密码，说明是在修改
            
            [self setTip:@"请输入新的密码"]; // 这里和下面的delegate不一致，有空重构
            
        } else if (_nLockViewType == LLLockViewTypeClean) { // 清除密码
            
            [LLLockPassword saveLockPassword:nil];
            [self hide];
            
            [self showAlert:self.tip2];
            
        } else { // 验证成功
            
            [self hide];
        }
        
    }
    // 验证密码错误
    else if (string.length > 0) {
        
        nRetryTimesRemain--;
        
        if (nRetryTimesRemain > 0) {
            
            if (1 == nRetryTimesRemain) {
                [self setErrorTip:[NSString stringWithFormat:@"最后的机会咯-_-!"]
                        errorPswd:string];
            } else {
                [self setErrorTip:[NSString stringWithFormat:@"密码错误，还可以再输入%d次", nRetryTimesRemain]
                        errorPswd:string];
            }
            
        } else {
            
            // 强制注销该账户，并清除手势密码，以便重设
            [self dismissViewControllerAnimated:NO completion:nil]; // 由于是强制登录，这里必须以NO ani的方式才可
            [LLLockPassword saveLockPassword:nil];
            
            [self showAlert:@"超过最大次数，这里该做一些如强制退出重设密码等操作"];
        }
        
    } else {
        NSAssert(YES, @"意外情况");
    }
}

- (void)createPassword:(NSString*)string
{
    // 输入密码
    if ([self.passwordNew isEqualToString:@""] && [self.passwordconfirm isEqualToString:@""]) {
        
        self.passwordNew = string;
        [self setTip:self.tip2];
    }
    // 确认输入密码
    else if (![self.passwordNew isEqualToString:@""] && [self.passwordconfirm isEqualToString:@""]) {
        
        self.passwordconfirm = string;
        
        if ([self.passwordNew isEqualToString:self.passwordconfirm]) {
            // 成功
            LLLog(@"两次密码一致");
            
            [LLLockPassword saveLockPassword:string];
            
            [self showAlert:self.tip3];
            
            [self hide];
            
        } else {
            
            self.passwordconfirm = @"";
            [self setTip:self.tip2];
            [self setErrorTip:@"与上一次绘制不一致，请重新绘制" errorPswd:string];
            
        }
    } else {
        NSAssert(1, @"设置密码意外");
    }
}

#pragma mark - 显示提示
- (void)setTip:(NSString*)tip
{
    [SVProgressHUD dismissWithSuccess: tip ];
    [_tipLable setText:tip];
    [_tipLable setTextColor:kTipColorNormal];
    
    _tipLable.alpha = 0;
    [UIView animateWithDuration:0.8
                     animations:^{
                         _tipLable.alpha = 1;
                     }completion:^(BOOL finished){
                     }
     ];
}

// 错误
- (void)setErrorTip:(NSString*)tip errorPswd:(NSString*)string
{
    // 显示错误点点
    [self.lockview showErrorCircles:string];
    
    // 直接_变量的坏处是
    [_tipLable setText:tip];
    [_tipLable setTextColor:kTipColorError];
    
    [self shakeAnimationForView:_tipLable];
}

#pragma mark 新建/修改后保存
- (void)updateTipButtonStatus
{
    LLLog(@"重设TipButton");
    if ((_nLockViewType == LLLockViewTypeCreate || _nLockViewType == LLLockViewTypeModify) &&
        ![self.passwordNew isEqualToString:@""]) // 新建或修改 & 确认时 才显示按钮
    {
        [self.tipButton setTitle:@"点击此处以重新开始" forState:UIControlStateNormal];
        [self.tipButton setAlpha:1.0];
        
    } else {
        [self.tipButton setAlpha:0.0];
    }
    
//    // 更新指示圆点
//    if (![self.passwordNew isEqualToString:@""] && [self.passwordconfirm isEqualToString:@""]){
//        self.indecator.hidden = NO;
//        [self.indecator setPasswordString:self.passwordNew];
//    } else {
//        self.indecator.hidden = YES;
//    }
}

#pragma mark - 点击了按钮
- (IBAction)tipButtonPressed:(id)sender {
    self.passwordNew = @"";
    self.passwordconfirm = @"";
    [self setTip:self.tip1];
    [self updateTipButtonStatus];
}

#pragma mark - 成功后返回
- (void)hide
{
    switch (_nLockViewType) {
            
        case LLLockViewTypeCheck:
        {
        }
            break;
        case LLLockViewTypeCreate:
        case LLLockViewTypeModify:
        {
            [LLLockPassword saveLockPassword:self.passwordNew];
        }
            break;
        case LLLockViewTypeClean:
        default:
        {
            [LLLockPassword saveLockPassword:nil];
        }
    }
    
    // 在这里可能需要回调上个页面做一些刷新什么的动作
    
#ifdef LLLockAnimationOn
    [self captureCurrentSnap];
    // 隐藏控件
    for (UIView* v in self.view.subviews) {
        if (v.tag > 10000) continue;
        v.hidden = YES;
    }
    // 动画解锁
    [self animateUnlock];
#else
    [self dismissViewControllerAnimated:NO completion:nil];
#endif
    
}

#pragma mark - delegate 每次划完手势后
- (void)lockString:(NSString *)string
{
    LLLog(@"这次的密码=--->%@<---", string) ;
    
    switch (_nLockViewType) {
            
        case LLLockViewTypeCheck:
        {
            self.tip1 = @"请输入解锁密码";
            [self checkPassword:string];
        }
            break;
        case LLLockViewTypeCreate:
        {
            self.tip1 = @"创建解锁密码";
            self.tip2 = @"请再次绘制解锁密码";
            self.tip3 = @"解锁密码创建成功";
            [self createPassword:string];
        }
            break;
        case LLLockViewTypeModify:
        {
            if ([self.passwordOld isEqualToString:@""]) {
                self.tip1 = @"请输入原来的密码";
                [self checkPassword:string];
            } else {
                self.tip1 = @"请输入新的密码";
                self.tip2 = @"请再次输入密码";
                self.tip3 = @"密码修改成功";
                [self createPassword:string];
            }
        }
            break;
        case LLLockViewTypeClean:
        default:
        {
            self.tip1 = @"请输入密码以清除密码";
            self.tip2 = @"清除密码成功";
            [self checkPassword:string];
        }
    }
    
    [self updateTipButtonStatus];
}

#pragma mark - 解锁动画
// 截屏，用于动画
#ifdef LLLockAnimationOn
- (UIImage *)imageFromView:(UIView *)theView
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

// 上一界面截图
- (void)capturePreSnap
{
    self.preSnapImageView.hidden = YES; // 默认是隐藏的
    self.preSnapImageView.image = [self imageFromView:self.presentingViewController.view];
}

// 当前界面截图
- (void)captureCurrentSnap
{
    self.currentSnapImageView.hidden = YES; // 默认是隐藏的
    self.currentSnapImageView.image = [self imageFromView:self.view];
}

- (void)animateUnlock{
    
    self.currentSnapImageView.hidden = NO;
    self.preSnapImageView.hidden = NO;
    
    static NSTimeInterval duration = 0.5;
    
    // currentSnap
    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:2.0];
    
    CABasicAnimation *opacityAnimation;
    opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue=[NSNumber numberWithFloat:1];
    opacityAnimation.toValue=[NSNumber numberWithFloat:0];
    
    CAAnimationGroup* animationGroup =[CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation, opacityAnimation];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animationGroup.duration = duration;
    animationGroup.delegate = self;
    animationGroup.autoreverses = NO; // 防止最后显现
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [self.currentSnapImageView.layer addAnimation:animationGroup forKey:nil];
    
    // preSnap
    scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    
    opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:1];
    
    animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation, opacityAnimation];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animationGroup.duration = duration;
    
    [self.preSnapImageView.layer addAnimation:animationGroup forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.currentSnapImageView.hidden = YES;
    [self dismissViewControllerAnimated:NO completion:nil];
}
#endif

#pragma mark 抖动动画
- (void)shakeAnimationForView:(UIView *)view
{
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 10, position.y);
    CGPoint right = CGPointMake(position.x + 10, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    
    [viewLayer addAnimation:animation forKey:nil];
}

#pragma mark - 提示信息
- (void)showAlert:(NSString*)string
{
    [SVProgressHUD showSuccessWithStatus: string duration:0.6];
    
//    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
//                                                    message:string
//                                                   delegate:nil
//                                          cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//    [alert show];
}

- (void)quitAction
{
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"pwd"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissModalViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_TO_ROOTCONTROLLER object:nil];
}

@end