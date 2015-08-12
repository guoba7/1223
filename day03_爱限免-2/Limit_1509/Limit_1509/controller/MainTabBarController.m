//
//  MainTabBarController.m
//  Limit_1509
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建视图控制器
    [self createControllers];
}


//创建视图控制器
- (void)createControllers
{
    //视图控制器类名
    NSArray *ctrlArray = @[@"LimitFreeViewController",@"ReduceViewController",@"FreeViewController",@"SubjectViewController",@"HotViewController"];
    //标题文字
    NSArray *nameArray = @[@"限免",@"降价",@"免费",@"专题",@"热榜"];
    //图片
    NSArray *imageArray = @[@"tabbar_limitfree",@"tabbar_reduceprice",@"tabbar_appfree",@"tabbar_subject",@"tabbar_rank"];
    NSArray *selectImageArray = @[@"tabbar_limitfree_press",@"tabbar_reduceprice_press",@"tabbar_appfree_press",@"tabbar_subject_press",@"tabbar_rank_press"];
    
    //循环创建视图控制器
    NSMutableArray *navArray = [NSMutableArray array];
    for (int i=0; i<ctrlArray.count; i++) {
       //类名
        //ctrlArray[i] == [ctrlArray objectAtIndex:i]
        NSString *className = ctrlArray[i];
        //cls包含类的名字和属性以及方法等内容
        Class cls = NSClassFromString(className);
        //创建视图控制器
        UIViewController *vc = [[cls alloc] init];
        
        //图片
        NSString *imageName = imageArray[i];
        NSString *selectImageName = selectImageArray[i];
        //imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal
        //表示使用原始图片
        vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //标题文字
        NSString *title = nameArray[i];
        vc.tabBarItem.title = title;
        
        //添加导航
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [navArray addObject:navCtrl];
    }
    self.viewControllers = navArray;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
