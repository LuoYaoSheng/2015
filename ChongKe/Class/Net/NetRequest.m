//
//  NetRequest.m
//  TestSocket
//
//  Created by Air on 14/12/4.
//  Copyright (c) 2014年 yunqihudong. All rights reserved.
//

#import "NetRequest.h"
#import "Httper.h"
#import "JSON.h"
#import <CommonCrypto/CommonDigest.h>

#define URL_BASIC                   @"http://218.207.182.227:8080/ics/clientInterface?act="

@implementation NSString (MD5_)

+ (NSString *)md5HexDigest:(NSString*)input
{
    const char *cStr = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (unsigned int)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

@end

@interface NetRequest ()<HttpConnectResultDelegate>
{
    Httper *_http;
}

@end

@implementation NetRequest

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization.
        _http = [[Httper alloc]init];
        _http.delegate = self;
    }
    return self;
}

#pragma mark - inline fun
- (void)requestPost:(NSString *)pUrl data:(NSData *)pData operation:(int)pOperation
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:pUrl]];
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%d", pData.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:pData];
    [request setTimeoutInterval:TIME_OUT];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:pOperation] forKey:KEY_SEARCH];
    
    [_http   RequestWebDataWithRequest:request andParam:dic];
}

- (void)RequestPost:(NSString *)url iAct:(NSInteger)iAct
{
    [_http RequestWebDataWithURL:url
                        andParam:[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:iAct] forKey:KEY_SEARCH]];
}

// Http连接失败的回调（委托）函数
-(void) httpConnect:(Httper *)httpConnect error:(NSError *)error with:(NSDictionary *)pDicParam
{
    if ([_delegate respondsToSelector:@selector(httpRequestFail:action:)])
    {
        [_delegate httpRequestFail:@"请求超时！" operation:[[pDicParam objectForKey:KEY_SEARCH]intValue]];
    }
}

//Http响应信息头的回调（委托）函数
-(void) httpConnect:(Httper *)pHttpConnect receiveResponseWithStatusCode:(NSInteger)pStatusCode andAllHeaderFields:(NSDictionary *)pDicAllHeaderFields with:(NSDictionary *)pDicParam
{
    if(pStatusCode < 200 || pStatusCode > 300){
        if([_delegate respondsToSelector:@selector(httpRequestFail:operation:)]){
            [_delegate httpRequestFail:@"请求错误！" operation:[[pDicParam objectForKey:KEY_SEARCH]intValue]];
        }
        return;
    }
}

//Http返回数据全部接收完毕的回调（委托）函数
-(void) httpConnect:(Httper *)httpConnect finish:(NSData *)pData with:(NSDictionary *)pDicParam
{
    int iAct = [[pDicParam objectForKey:KEY_SEARCH] intValue];
    NSString *respon = [[NSString alloc] initWithData:pData  encoding:NSUTF8StringEncoding];

    //JSON格式的转化
    NSDictionary *dic = [respon JSONValue];
    if ( [[respon JSONValue] isKindOfClass:[NSDictionary class]] ) {
        if ( 200 == [[dic objectForKey:@"code"]intValue] ) {
            if([_delegate respondsToSelector:@selector(httpRequesSucess:operation:)]){
                [_delegate httpRequesSucess:dic operation:iAct];
            }
        }else{
            if([_delegate respondsToSelector:@selector(httpRequestFail:operation:)]){
                [_delegate httpRequestFail:[dic objectForKey:@"des"] operation:iAct];
            }
        }
    }else{
        if([_delegate respondsToSelector:@selector(httpRequestFail:operation:)]){
            [_delegate httpRequestFail:@"请求错误！" operation:iAct];
        }
    }
}

#pragma mark - request operate
//取消网络请求
- (BOOL)cancelRequest:(NSDictionary *)dicParam
{
    return [_http CancelRequest:dicParam];
}
//清空网络请求
- (void)clearRequest
{
    [_http ClearRequest];
}


#pragma mark - 业务
- (void)Login:(NSString *)tel pwd:(NSString *)pwd;
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_login"];
    NSString *sJon = [NSString stringWithFormat:@"{\"phone\":\"%@\",\"pwd\":\"%@\"}", tel, [NSString md5HexDigest:pwd]];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    [self requestPost:url data:postData operation:Type_Login];
}

- (void)Login_newpwd:(NSString *)tel pwd:(NSString *)pwd
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_login_newpwd"];
    NSString *sJon = [NSString stringWithFormat:@"{\"phone\":\"%@\",\"pwd\":\"%@\"}", tel, [NSString md5HexDigest:pwd]];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    [self requestPost:url data:postData operation:Type_Login_newpwd];
}

- (void)Login_newpwd:(NSString *)userId
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_login_newpwd"];
    NSString *sJon = [NSString stringWithFormat:@"{\"id\":\"%@\"}", userId ];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    [self requestPost:url data:postData operation:Type_Login_newpwd];
}

- (void)User_list:(NSString *)name
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_user_list"];
    NSString *sJon = [NSString stringWithFormat:@"{\"name\":\"%@\"}", name];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    [self requestPost:url data:postData operation:Type_User_list];
}

- (void)Group_search:(NSString *)ename level_s:(int)level_s fs:(NSString *)fs name:(NSString *)name
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_group_search"];
    NSString *sJon = [NSString stringWithFormat:@"{\"ename\":\"%@\",\"level_s\":%d,\"fs\":\"%@\",\"name\":\"%@\"}", ename, level_s,fs,name];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    
    [self requestPost:url data:postData operation:Type_Group_search];
}
- (void)Group_list:(NSString *)ecode
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_group_list"];
    NSString *sJon = [NSString stringWithFormat:@"{\"ecode\":\"%@\"}", ecode];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    [self requestPost:url data:postData operation:Type_Group_list];
}
- (void)Group_update:(NSString *)sId ecode:(NSString *)ecode ename:(NSString *)ename gname:(NSString *)gname dept:(NSString *)dept level_s:(int)level_s job:(NSString *)job yd:(NSString *)yd lt:(NSString *)lt dx:(NSString *)dx interest:(NSString *)interest work:(NSString *)work khjl:(NSString *)khjl fs:(NSString *)fs client:(NSString *)client
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_group_update"];
    NSString *sJon = [NSString stringWithFormat:@"{\"id\":\"%@\",\"ecode\":\"%@\",\"ename\":\"%@\",\"gname\":\"%@\",\"dept\":\"%@\",\"level_s\":%d,\"job\":\"%@\",\"yd\":\"%@\",\"lt\":\"%@\",\"interest\":\"%@\",\"work\":\"%@\",\"khjl\":\"%@\",\"fs\":\"%@\",\"client\":\"%@\"}", sId, ecode, ename, gname, dept, level_s, job, yd, lt, interest,work, khjl, fs, client];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    [self requestPost:url data:postData operation:Type_Group_update];
}
- (void)Group_add:(NSString *)ecode ename:(NSString *)ename gname:(NSString *)gname dept:(NSString *)dept level_s:(int)level_s job:(NSString *)job yd:(NSString *)yd lt:(NSString *)lt dx:(NSString *)dx interest:(NSString *)interest work:(NSString *)work khjl:(NSString *)khjl fs:(NSString *)fs client:(NSString *)client
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_group_add"];
    NSString *sJon = [NSString stringWithFormat:@"{\"ecode\":\"%@\",\"ename\":\"%@\",\"gname\":\"%@\",\"dept\":\"%@\",\"level_s\":%d,\"job\":\"%@\",\"yd\":\"%@\",\"lt\":\"%@\",\"interest\":\"%@\",\"work\":\"%@\",\"khjl\":\"%@\",\"fs\":\"%@\",\"client\":\"%@\"}", ecode, ename, gname, dept, level_s, job, yd, lt, interest,work, khjl, fs, client];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    [self requestPost:url data:postData operation:Type_Group_add];
}
- (void)Report:(NSString *)phone ny:(NSString *)ny
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_report"];
    NSString *sJon = [NSString stringWithFormat:@"{\"phone\":\"%@\",\"ny\":\"%@\"}", phone,ny];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    [self requestPost:url data:postData operation:Type_Report];
}
- (void)Feedback_add:(NSString *)msg client:(NSString *)client uname:(NSString *)uname phone:(NSString *)phone
{
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASIC, @"a_feedback_add"];
    NSString *sJon = [NSString stringWithFormat:@"{\"msg\":\"%@\",\"client\":\"%@\",\"uname\":\"%@\",\"phone\":\"%@\"}", msg,client,uname,phone];
    NSData *postData = [sJon dataUsingEncoding:NSUTF8StringEncoding];
    [self requestPost:url data:postData operation:Type_Report];
}
- (void)Check_update
{
    NSString *url = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@", @"954270"];
    [self RequestPost:url iAct:Type_Check_update];
}
@end

