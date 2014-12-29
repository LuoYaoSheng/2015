//
//  HTTPConnection.h
//  GameCount
//
//  Created by Lys on 13-1-9.
//  Copyright (c) 2013年 lys. All rights reserved.
//

#import <Foundation/Foundation.h>

/* -- 备注  暂时去除重复请求禁止方式
 */

#define     MAXNUMBER_HTTPCONNECTION           30
#define     TIME_OUT                           60.0
#define     KEY_SEARCH                         @"type"

@protocol HttpConnectResultDelegate;


@interface Httper : NSObject
{
    int                 _numberOfHTTPConnection;
    NSMutableArray*                 _mutabArrayTaskDic;
}
@property (nonatomic, retain) id <HttpConnectResultDelegate> delegate;

// 根据URL获取Web数据
- (BOOL)RequestWebDataWithURL:(NSString *)strURL andParam:(NSDictionary *)dicParam;

// 根据URLRequest获取Web数据
- (BOOL)RequestWebDataWithRequest:(NSURLRequest *)request andParam:(NSDictionary *)dicParam;

//取消网络请求
- (BOOL)CancelRequest:(NSDictionary *)dicParam;

//清空网络请求
- (void)ClearRequest;

@end



/********************************************************************************/
/*** Http 连接返回结果的回调（委托）处理函数的协议定义 ***********************************/
/********************************************************************************/
@protocol HttpConnectResultDelegate <NSObject>

@optional

//Http连接失败时的回调（委托）函数
- (void)httpConnect:(Httper *)httpConnect error:(NSError *)error with:(NSDictionary *)dicParam;

//Http响应信息头时的回调（委托）函数
- (void)httpConnect:(Httper *)httpConnect receiveResponseWithStatusCode:(NSInteger)statusCode andAllHeaderFields:(NSDictionary *)dicAllHeaderFields with:(NSDictionary *)dicParam;

//Http返回信息体时的回调（委托）函数
- (void)httpConnect:(Httper *)httpConnect receiveData:(NSData *)data with:(NSDictionary *)dicParam;

//Http返回数据全部接收完毕时的回调（委托）函数
- (void)httpConnect:(Httper *)httpConnect finish:(NSData *)data with:(NSDictionary *)dicParam;

@end
