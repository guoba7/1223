//
//  SearchViewController.m
//  Limit_1509
//
//  Created by gaokunpeng on 15/7/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SearchViewController.h"
#import "LimitModel.h"
#import "LimitCell.h"

@interface SearchViewController ()<MyDownloaderDelegate,UISearchBarDelegate>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航
    [self createMyNav];
    
    //修改tableView的frame
    _tbView.frame = CGRectMake(0, 64, 375, 667-64);
    
    //搜索框
    [self createSearchBar];
}

//搜索框
- (void)createSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 375, 40)];
    searchBar.delegate = self;
    searchBar.text = self.keyword;
    
    _tbView.tableHeaderView = searchBar;
    
}

- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//导航
- (void)createMyNav
{
    //返回按钮
    UIButton *btn = [self addNavBtn:CGRectMake(0, 0, 60, 36) title:@"返回" target:self action:@selector(backAction:) isLeft:YES];
    [btn setBackgroundImage:[UIImage imageNamed:@"buttonbar_back"] forState:UIControlStateNormal];
    
    //标题
    [self addNavTitle:CGRectMake(60, 0, 255, 44) title:@"搜索"];
    
}

//下载数据
- (void)downloadData
{
    //进入下载状态
    _isLoading = YES;
    
    MyDownloader *downloader = [[MyDownloader alloc] init];
    downloader.delegate = self;
    
    NSString *urlString = [NSString stringWithFormat:kLimitSearchUrl,_curPage,self.keyword];
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
    if (_curPage == 1) {
        [_dataArray removeAllObjects];
    }
    
    id result = [NSJSONSerialization JSONObjectWithData:downloader.receiveData options:NSJSONReadingMutableContainers error:nil];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = result;
        for (NSDictionary *limitDict in dict[@"applications"]) {
            //创建模型对象
            LimitModel *model = [[LimitModel alloc]     init];
            [model setValuesForKeysWithDictionary:limitDict];
            [_dataArray addObject:model];
        }
        //刷新表格
        [_tbView reloadData];
        
        //结束下载
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
    static NSString *cellId = @"limitCellId";
    LimitCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LimitCell" owner:nil options:nil] lastObject];
    }
    //显示数据
    LimitModel *model = _dataArray[indexPath.row];
    [cell configModel:model index:indexPath.row cutLength:0];
    return cell;
}

#pragma mark - MJRefreshBaseView代理
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

#pragma mark - UISearchBar代理
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //显示取消按钮
    searchBar.showsCancelButton = YES;
    
    UIView *firstSub = [searchBar.subviews lastObject];
    NSArray *subArray = firstSub.subviews;
    for (UIView *sub in subArray) {
        if ([sub isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            
            UIButton *btn = (UIButton *)sub;
            //修改文字和背景图片
            [btn setTitle:@"取消" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            [btn setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
        }
    }
    
}

//点击取消按钮
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    searchBar.showsCancelButton = NO;
    
}

//点击搜索按钮
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //收起键盘
    [searchBar resignFirstResponder];
    
    //重新下载数据
    self.keyword = searchBar.text;
    
    _curPage = 1;
    
    [self downloadData];
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
