//
//  AboutViewController.m
//  ChongKe
//
//  Created by Lys on 14/12/20.
//  Copyright (c) 2014年 zzzili. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 132)];
    [view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:view];
    view.center = CGPointMake(self.view.center.x, self.view.center.y-30);
    
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake( (view.frame.size.width-72)*0.5, 0, 72, 72)];
    [imgView setImage:[UIImage imageNamed:@"ic_launcher.png"]];
    [view addSubview:imgView];

    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, imgView.frame.origin.y+imgView.frame.size.height+20, self.view.frame.size.width, 21)];
    name.text = @"重要厅处级领导信息管理";
    [name setBackgroundColor:[UIColor clearColor]];
    name.textAlignment = NSTextAlignmentCenter;
    [view addSubview:name];
    
    UILabel *version = [[UILabel alloc]initWithFrame:CGRectMake(0, name.frame.origin.y+name.frame.size.height, self.view.frame.size.width, 21)];
    version.text = [NSString stringWithFormat:@"v%@", [[[NSBundle mainBundle] infoDictionary]  objectForKey:@"CFBundleShortVersionString"] ];
    [version setBackgroundColor:[UIColor clearColor]];
    version.textAlignment = NSTextAlignmentCenter;
    version.font = [UIFont systemFontOfSize:14];
    [view addSubview:version];
    
    
    UILabel *copyright = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-30, self.view.frame.size.width, 21)];
    copyright.text = [NSString stringWithFormat:@"%@ 版权所有", @"中国移动通信集团福建有限公司" ];
    [copyright setBackgroundColor:[UIColor clearColor]];
    copyright.textAlignment = NSTextAlignmentCenter;
    copyright.font = [UIFont systemFontOfSize:9];
    copyright.textColor = [UIColor grayColor];
    [self.view addSubview:copyright];
    
//    UILabel *copyright2 = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-30, self.view.frame.size.width, 21)];
//    copyright2.text = [NSString stringWithFormat:@"Copyright (c) 2014年 %@. All rights reserved.", @"China Mobile" ];
//    [copyright2 setBackgroundColor:[UIColor clearColor]];
//    copyright2.textAlignment = NSTextAlignmentCenter;
//    copyright2.font = [UIFont systemFontOfSize:9];
//    copyright2.textColor = [UIColor grayColor];
//    [self.view addSubview:copyright2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
