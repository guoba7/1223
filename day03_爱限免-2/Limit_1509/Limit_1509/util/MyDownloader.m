//
//  MyDownloader.m
//  Limit_1509
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyDownloader.h"

@implementation MyDownloader
{
    //下载对象
    NSURLConnection *_conn;
    //存储下载回来的数据
    NSMutableData *_receiveData;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
       //初始化接收下载数据的对象
        _receiveData = [NSMutableData data];        
    }
    return self;
}

-(void)downloadWithUrlString:(NSString *)urlString
{
    //1.创建NSURL类型的对象
    NSURL *url = [NSURL URLWithString:urlString];
    
    //2.创建NSURLRequest类型的对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //3.创建NSURLConnection类型的对象
    _conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
}

#pragma mark - NSURLConnection代理
//下载失败时调用的方法
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (self.delegate) {
        [self.delegate downloader:self failWithError:error];
    }
}

//下载成功
//准备接收数据
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receiveData setLength:0];
}

//接收下载回来的数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}

//下载完成
//程序会自动切换到主线程
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (self.delegate) {
        [self.delegate downloaderFinish:self];
    }
}


@end
