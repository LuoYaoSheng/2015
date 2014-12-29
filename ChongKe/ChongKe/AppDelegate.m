//
//  AppDelegate.m
//  TestSocket
//
//  Created by zzzili on 13-5-17.
//  Copyright (c) 2013年 zzzili. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    LoginViewController *controller = [[LoginViewController alloc]init];
    _navigationController = [[UINavigationController alloc]initWithRootViewController:controller];
    
    self.window.rootViewController = _navigationController;
    
    if([self.window respondsToSelector:@selector(setRootViewController:)]){
        [self.window setRootViewController:_navigationController];
    }else{
        [self.window addSubview:_navigationController.view];
    }
    
    if([[UIApplication sharedApplication]  respondsToSelector:@selector(setStatusBarStyle:)]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toRootController:) name:NOTIFY_TO_ROOTCONTROLLER object:nil];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 弹出手势解锁密码输入框
- (void)showLLLockViewController:(LLLockViewType)type
{
    if(self.window.rootViewController.presentingViewController == nil){

        LLLog(@"root = %@", self.window.rootViewController.class);
        LLLog(@"lockVc isBeingPresented = %d", [self.lockVc isBeingPresented]);

        self.lockVc = [[LLLockViewController alloc] init];
        self.lockVc.nLockViewType = type;

        self.lockVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

        [self.window.rootViewController presentViewController:self.lockVc animated:NO completion:^{
        }];
        LLLog(@"创建了一个pop=%@", self.lockVc);
    }
}

#pragma mark - 通知
- (void)toRootController:(NSNotification*)pNotify{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
