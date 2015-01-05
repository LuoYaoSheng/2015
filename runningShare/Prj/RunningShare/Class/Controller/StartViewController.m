//
//  StartViewController.m
//  RunningShare
//
//  Created by Lys on 14/11/21.
//  Copyright (c) 2014年 Eric. All rights reserved.
//

#import "StartViewController.h"


@interface StartViewController ()<UIScrollViewDelegate>
{
    UIPageControl *m_pageControl;
}
@end

@implementation StartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    
    //可以添加动画~~~
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.center = self.view.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"添加动画~~~~";
    [self.view addSubview:label];
    
    [self performSelector:@selector(UI_gotoNextVc) withObject:nil afterDelay:1];
}

- (void)UI_gotoNextVc
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstLaunched"]){
        [self performSegueWithIdentifier:@"WelcomeSuccessfully" sender:nil];
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstLaunched"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self performSegueWithIdentifier:@"WelcomeController" sender:nil];
    }
}

@end