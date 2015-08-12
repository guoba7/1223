//
//  BaseViewController.m
//  Limit_1509
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BaseViewController.h"
#import "MyUtil.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建表格
    [self createTableView];
    
    //下载
    _dataArray = [NSMutableArray array];
    
    _isLoading = NO;
    _curPage = 1;
}

//创建表格
- (void)createTableView
{
    //在导航下面显示表格
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375, 667-64-49) style:UITableViewStylePlain];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    //去掉分割线
    _tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tbView];
    
    
    //下拉刷新
    _headerView = [MJRefreshHeaderView header];
    _headerView.scrollView = _tbView;
    _headerView.delegate = self;
    
    //上拉加载更多
    _footerView = [MJRefreshFooterView footer];
    _footerView.scrollView = _tbView;
    _footerView.delegate = self;
    
    //下拉刷新
    [_headerView beginRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    _headerView.scrollView = nil;
    _footerView.scrollView = nil;
}

-(UIButton *)addNavBtn:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action isLeft:(BOOL)isLeft
{
    //按钮
    UIButton *btn = [MyUtil createBtnFrame:frame title:title bgImageName:@"buttonbar_action" target:target action:action];
    //设置颜色
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //UIBarButtonItem
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = item;
    }else{
        self.navigationItem.rightBarButtonItem = item;
    }

    return btn;
}

-(void)addNavTitle:(CGRect)frame title:(NSString *)title
{
    //字体
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    //颜色
    UIColor *color = [UIColor colorWithRed:80.0f/255.0f green:180.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    
    UILabel *label = [MyUtil createLabelFrame:frame title:title font:font textAlignment:NSTextAlignmentCenter numberOfLines:1 textColor:color];
    self.navigationItem.titleView = label;
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"子类必须实现方法%s",__FUNCTION__);
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"子类必须实现方法%s",__FUNCTION__);
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"子类必须实现方法%s",__FUNCTION__);
    return nil;
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
