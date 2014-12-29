//
//  HTTPConnection.m
//  GameCount
//
//  Created by Lys on 13-1-9.
//  Copyright (c) 2013年 lys. All rights reserved.
//
#import "Httper.h"


@interface Httper (Private)

- (void)startHTTPConnection;

@end

@implementation Httper
@synthesize delegate = _delegate;

-(id) init
{
    self = [super init];
    if (self) {
        // Custom initialization.
        _numberOfHTTPConnection = 0;
        _mutabArrayTaskDic = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

-(void) dealloc
{
    //清空任务
    [self ClearRequest];
}

// 根据URL获取Web数据
// dicParam
//    type:int,请求类型
-(BOOL) RequestWebDataWithURL:(NSString *)strURL andParam:(NSDictionary *)dicParam
{
    if (nil == dicParam) {
        return NO;
    }
    
    NSURL *url = [NSURL URLWithString:strURL];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setTimeoutInterval:TIME_OUT];
    BOOL success = [self RequestWebDataWithRequest:request andParam:dicParam];
    return success;
}

// 根据URLRequest获取Web数据
// dicParam
//    type:int,请求类型
-(BOOL) RequestWebDataWithRequest:(NSURLRequest *)request andParam:(NSDictionary *)dicParam
{
    if (nil == dicParam) {
        return NO;
    }
    //请求类型必须存在
    if (nil == [dicParam objectForKey:KEY_SEARCH]) {
        return NO;
    }
    /* -- 备注
    //正在处理或等待处理的任务不再接收
    for (NSDictionary *dicTask in _mutabArrayTaskDic) {
        //
        if ([dicParam isEqualToDictionary:[dicTask objectForKey:@"param"]]) {
            return NO;
        }
    }
    */
    NSMutableDictionary *mdicTask = [[NSMutableDictionary alloc] initWithCapacity:3];
    //设置数据缓存
    NSMutableData *mdataCache = [[NSMutableData alloc] init];
    [mdicTask setObject:mdataCache forKey:@"cache"];
    //参数
    [mdicTask setObject:dicParam forKey:@"param"];
    //创建HTTP网络连接
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [mdicTask setObject:urlConnection forKey:@"connect"];
    //保存到数组
    [_mutabArrayTaskDic addObject:mdicTask];
    
    [self startHTTPConnection];
    return YES;
}

//取消网络请求
-(BOOL) CancelRequest:(NSDictionary *)dicParam
{
    if (nil == dicParam) {
        return NO;
    }
    //遍历所有任务
    for (int i = 0; i < _mutabArrayTaskDic.count; i++) {
        //查看任务是否相同
        NSDictionary *dicTask = [_mutabArrayTaskDic objectAtIndex:i];
        if ([dicParam isEqualToDictionary:[dicTask objectForKey:@"param"]]) {
            //取消网络请求
            NSURLConnection *connect = [dicTask objectForKey:@"connect"];
            [connect cancel];
            //从任务队列中删除
            [_mutabArrayTaskDic removeObjectAtIndex:i];
            _numberOfHTTPConnection -= 1;
            return YES;
        }
    }
    return NO;
}

//清空网络请求
-(void) ClearRequest
{
    //遍历所有任务
    for (NSDictionary *dicTask in _mutabArrayTaskDic) {
        NSURLConnection *connect = [dicTask objectForKey:@"connect"];
        [connect cancel];
        //
        _numberOfHTTPConnection -= 1;
    }
    //从任务队列中删除
    [_mutabArrayTaskDic removeAllObjects];
}

//NSURLConnection连接失败
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSDictionary *dicTask = nil;
    for (int i = 0; i < _mutabArrayTaskDic.count; i++) {
        NSDictionary *dic = [_mutabArrayTaskDic objectAtIndex:i];
        //找到网络连接相应的数据字典
        if ([dic objectForKey:@"connect"] == connection) {
            dicTask = dic;
            break;
        }
    }
    
    //
    if (dicTask) {
        //删除
        [_mutabArrayTaskDic removeObject:dicTask];
        NSDictionary *dicParam = [dicTask objectForKey:@"param"];
        if ([_delegate respondsToSelector:@selector(httpConnect:error:with:)]) {
            [_delegate httpConnect:self error:error with:dicParam];
        };
        _numberOfHTTPConnection -= 1;
    }
    
    [self startHTTPConnection];
}

//NSURLConnection返回的http响应信息头
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSDictionary *dicTask = nil;
    for (int i = 0; i < _mutabArrayTaskDic.count; i++) {
        NSDictionary *dic = [_mutabArrayTaskDic objectAtIndex:i];
        //找到网络连接相应的数据字典
        if ([dic objectForKey:@"connect"] == connection) {
            dicTask = dic;
            break;
        }
    }
    //
    if ([response isMemberOfClass:NSHTTPURLResponse.class]) {
        NSHTTPURLResponse *responseHTTP = (NSHTTPURLResponse *)response;
        NSUInteger statusCode = responseHTTP.statusCode;
        NSDictionary *dicAllHeaderFields = responseHTTP.allHeaderFields;
        NSDictionary *dicParam = [dicTask objectForKey:@"param"];
        //收到服务器返回的HTTP信息头
        SEL receiveResponse = @selector(httpConnect:receiveResponseWithStatusCode:andAllHeaderFields:with:);
        if ([self.delegate respondsToSelector:receiveResponse]) {
            [self.delegate httpConnect:self receiveResponseWithStatusCode:statusCode
                    andAllHeaderFields:dicAllHeaderFields with:dicParam];
        }
    }
}

//NSURLConnection返回的http的信息体部分
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSDictionary *dicTask = nil;
    for (int i = 0; i < _mutabArrayTaskDic.count; i++) {
        NSDictionary *dic = [_mutabArrayTaskDic objectAtIndex:i];
        //找到网络连接相应的数据字典
        if ([dic objectForKey:@"connect"] == connection) {
            dicTask = dic;
            break;
        }
    }
    if (dicTask) {
        //向缓存中添加数据
        NSMutableData *mdataCache = [dicTask objectForKey:@"cache"];
        [mdataCache appendData:data];
        NSDictionary *dicParam = [dicTask objectForKey:@"param"];
        //收到部分数据
        if ([self.delegate respondsToSelector:@selector(httpConnect:receiveData:with:)]) {
            [self.delegate httpConnect:self receiveData:data with:dicParam];
        }
    }
}

//NSURLConnection返回的数据，全部下载（接收）成功
-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *dicTask = nil;
    for (int i = 0; i < _mutabArrayTaskDic.count; i++) {
        NSDictionary *dic = [_mutabArrayTaskDic objectAtIndex:i];
        //找到网络连接相应的数据字典
        if ([dic objectForKey:@"connect"] == connection) {
            dicTask = dic;
            break;
        }
    }
    
    //
    if (dicTask) {
        //删除
        [_mutabArrayTaskDic removeObject:dicTask];
        NSData *dataCache = [dicTask objectForKey:@"cache"];
        NSDictionary *dicParam = [dicTask objectForKey:@"param"];
        if ([_delegate respondsToSelector:@selector(httpConnect:finish:with:)]) {
            [_delegate httpConnect:self finish:dataCache with:dicParam];
        }
        _numberOfHTTPConnection -= 1;
    }
    
    [self startHTTPConnection];
}


-(void) startHTTPConnection
{
    if (_numberOfHTTPConnection < MAXNUMBER_HTTPCONNECTION) {
        if (_numberOfHTTPConnection < _mutabArrayTaskDic.count) {
            NSDictionary *dicTask = [_mutabArrayTaskDic objectAtIndex:_numberOfHTTPConnection];
            NSURLConnection *urlConnection = [dicTask objectForKey:@"connect"];
            [urlConnection start];
            //
            _numberOfHTTPConnection += 1;
        }
    }
}
@end
