//
//  MyUtil.h
//  Limit_1509
//
//  Created by gaokunpeng on 15/7/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyUtil : NSObject
/*
 @param frame:控件的文字
 @param title:标签的文字
 @param font:字体大小
 @param alignment:对齐方式
 @param numberOfLines:文字显示的行数
 @param textColor:文字颜色
 */
//创建标签的方法
+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font textAlignment:(NSTextAlignment)alignment numberOfLines:(NSInteger)numberOfLines textColor:(UIColor *)textColor;

+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font;

//创建按钮的方法
/*
 @param title:按钮的文字
 @param bgImageName:按钮的背景图片
 @param target:响应按钮事件的对象
 @param action:响应按钮事件的方法
 */
+ (UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title bgImageName:(NSString *)bgImageName target:(id)target action:(SEL)action;


//创建图片视图
+ (UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName;


@end
