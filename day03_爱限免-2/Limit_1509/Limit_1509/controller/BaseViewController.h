//
//  BaseViewController.h
//  Limit_1509
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Const.h"
#import "MyDownloader.h"
#import "MJRefresh.h"

@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
{
    //数据源数组
    NSMutableArray *_dataArray;
    //表格
    UITableView *_tbView;
    
    //下拉刷新
    MJRefreshHeaderView *_headerView;
    MJRefreshFooterView *_footerView;
    
    //是否正在加载
    BOOL _isLoading;
    //当前的页数
    NSInteger _curPage;
}

//添加导航上面的按钮
/*
 @param isLeft:是左边按钮还是右边按钮
 */
- (UIButton *)addNavBtn:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action isLeft:(BOOL)isLeft;

//添加导航上面的文字
- (void)addNavTitle:(CGRect)frame title:(NSString *)title;


@end
