//
//  ReduceViewController.m
//  Limit_1509
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ReduceViewController.h"
#import "LimitModel.h"
#import "ReduceCell.h"

@interface ReduceViewController ()<MyDownloaderDelegate>

@end

@implementation ReduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航
    [self createMyNav];
    
    
    //下载数据
    [self downloadData];
    
    
}

//导航
- (void)createMyNav
{
    //分类
    [self addNavBtn:CGRectMake(0, 0, 60, 36) title:@"分类" target:self action:@selector(gotoCategory:) isLeft:YES];
    //标题
    [self addNavTitle:CGRectMake(60, 0, 255, 44) title:@"降价"];
    //设置
    [self addNavBtn:CGRectMake(0, 0, 60, 36) title:@"设置" target:self action:@selector(gotoSet:) isLeft:NO];
}
//分类
- (void)gotoCategory:(id)sender{}
//设置
- (void)gotoSet:(id)sender{}

//下载数据
- (void)downloadData
{
    //进入刷新状态
    _isLoading = YES;
    
    MyDownloader *downloader = [[MyDownloader alloc] init];
    downloader.delegate = self;
    
    NSString *urlString = [NSString stringWithFormat:kReduceUrl,_curPage];
    [downloader downloadWithUrlString:urlString];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MyDownloader代理
-(void)downloader:(MyDownloader *)downloader failWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

-(void)downloaderFinish:(MyDownloader *)downloader
{
    //下拉刷新
    //一定要写在下载数据返回的地方
    if (_curPage == 1) {
        [_dataArray removeAllObjects];
    }
    
    
    //JSON解析
    id result = [NSJSONSerialization JSONObjectWithData:downloader.receiveData options:NSJSONReadingMutableContainers error:nil];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = result;
        
        NSArray *appArray = dict[@"applications"];
        for (NSDictionary *appDict in appArray) {
            //创建模型对象
            LimitModel *model = [[LimitModel alloc] init];
            //kvc
            [model setValuesForKeysWithDictionary:appDict];
            [_dataArray addObject:model];
        }
        //刷新表格
        [_tbView reloadData];
        
        //结束刷新
        _isLoading = NO;
        [_headerView endRefreshing];
        [_footerView endRefreshing];
    }
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"reduceCellId";
    
    ReduceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ReduceCell" owner:nil options:nil] lastObject];
    }
    //显示数据
    LimitModel *model = _dataArray[indexPath.row];
    [cell configModel:model index:indexPath.row];
    return cell;
}

#pragma mark - MJBaseRefreshView代理
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (_isLoading) {
        return;
    }
    
    if (refreshView == _headerView) {
        //下拉刷新
        _curPage = 1;
        [self downloadData];
    }else if (refreshView == _footerView){
        //上拉加载更多
        _curPage++;
        [self downloadData];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
