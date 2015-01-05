//
//  WelcomeController.m
//  RunningShare
//
//  Created by Lys on 14/11/20.
//  Copyright (c) 2014年 Eric. All rights reserved.
//

#import "WelcomeController.h"

@interface WelcomeController ()<UIScrollViewDelegate>
{
    UIPageControl *m_pageControl;
}
@end

@implementation WelcomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self UI_init];
    
}

#pragma mark - UI
- (void)UI_init
{
    m_pageControl = [[UIPageControl  alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-60, 39, 37)];
    [m_pageControl setCenter:CGPointMake( self.view.bounds.size.width*0.5, m_pageControl.center.y)];
    [m_pageControl setNumberOfPages:3];
    [self.view addSubview:m_pageControl];
    
    UIScrollView *sl = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [sl setContentSize:CGSizeMake(self.view.bounds.size.width * 3, 0)];
    [sl setBackgroundColor:[UIColor blueColor]];
    [sl setPagingEnabled:YES];
    [sl setBounces:NO];
    [sl setBackgroundColor:[UIColor orangeColor]];
    [sl setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:sl];
    [sl setDelegate:self];

    for (int idx = 0; idx < 3; idx++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:sl.bounds];
        [iv setImage:[UIImage imageNamed:[NSString stringWithFormat:@"IMG_004%d.PNG", idx+1]]];
        [iv setCenter:CGPointMake(sl.bounds.size.width*(0.5+idx), sl.bounds.size.height*0.5)];
        [sl addSubview:iv];
    }
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake( sl.contentSize.width - 120, sl.bounds.size.height-100, 100, 60)];
    [btn setBackgroundColor:[UIColor redColor]];
    [sl addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 页面处理
- (void) scrollViewDidScroll:(UIScrollView *)sender {
    
    CGFloat pageWidth = sender.frame.size.width;
    int currentPage = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    [m_pageControl setCurrentPage:currentPage];
}

#pragma mark - action
- (void)btnAction:(id)sender
{
    [self performSegueWithIdentifier:@"WelcomeSuccessfully" sender:nil];
}

@end
