//
//  NetRequest.h
//  TestSocket
//
//  Created by Air on 14/12/4.
//  Copyright (c) 2014年 yunqihudong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

//typedef NS_ENUM(NSInteger, NetError) {
//    NetError_Normal     = 0,
//    NetError_Logic      = 1,       //逻辑错误 －－ “系统繁忙，稍后重试”之类  存储错误，发送到服务器
//    NetError_Overtime   = 2,
//};

typedef NS_ENUM(NSInteger, NetType) {
    Type_Login = 100,//登录
    Type_Login_newpwd,
    Type_Login_resetpwd,
    Type_User_list,
    Type_Group_search,
    Type_Group_list,
    Type_Group_update,
    Type_Group_add,
    Type_Report,
    Type_Feedback_add,
    Type_Check_update,
    Type_New_report,
};
@protocol RequestResultProtocol;
@interface NetRequest : NSObject
@property (nonatomic, assign) id <RequestResultProtocol> delegate;
#pragma mark - bsaic
- (BOOL)cancelRequest:(NSDictionary *)pDicParam;                                                                         //取消网络请求
- (void)clearRequest;                                                                                                   //清空网络请求

#pragma mark - 业务
- (void)Login:(NSString *)tel pwd:(NSString *)pwd;
- (void)Login_newpwd:(NSString *)tel pwd:(NSString *)pwd;
- (void)Login_resetpwd:(NSString *)userId;
- (void)User_list:(NSString *)name;//管理员用id
- (void)Group_search:(NSString *)ename level_s:(int)level_s fs:(NSString *)fs name:(NSString *)name;
- (void)Group_list:(NSString *)ecode;
- (void)Group_update:(NSString *)sId ecode:(NSString *)ecode ename:(NSString *)ename gname:(NSString *)gname dept:(NSString *)dept level_s:(int)level_s job:(NSString *)job yd:(NSString *)yd lt:(NSString *)lt dx:(NSString *)dx interest:(NSString *)interest work:(NSString *)work khjl:(NSString *)khjl fs:(NSString *)fs client:(NSString *)client;
- (void)Group_add:(NSString *)ecode ename:(NSString *)ename gname:(NSString *)gname dept:(NSString *)dept level_s:(int)level_s job:(NSString *)job yd:(NSString *)yd lt:(NSString *)lt dx:(NSString *)dx interest:(NSString *)interest work:(NSString *)work khjl:(NSString *)khjl fs:(NSString *)fs client:(NSString *)client;
- (void)Report:(NSString *)phone ny:(NSString *)ny;
- (void)Feedback_add:(NSString *)msg client:(NSString *)client uname:(NSString *)uname phone:(NSString *)phone;
- (void)Check_update;
- (void)NewReport:(NSString *)phone ny:(NSString *)ny;
@end

@protocol RequestResultProtocol <NSObject>
@optional
- (void)httpRequestFail:(NSString *) err operation:(int)pOperation;
- (void)httpRequesSucess:(NSDictionary *)pDic operation:(int)pOperation;
@end
