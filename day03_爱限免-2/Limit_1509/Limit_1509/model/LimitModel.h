//
//  LimitModel.h
//  TestLimit
//
//  Created by gaokunpeng on 15/1/18.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LimitModel : NSObject

@property (nonatomic,copy)NSString *applicationId;
@property (nonatomic,copy)NSString *slug;
//名称
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *releaseDate;
@property (nonatomic,copy)NSString *version;
@property (nonatomic,copy,setter=setDescription:)NSString *myDescription;
@property (nonatomic,copy)NSString *categoryId;
@property (nonatomic,copy)NSString *categoryName;
//图片
@property (nonatomic,copy)NSString *iconUrl;
@property (nonatomic,copy)NSString *itunesUrl;
@property (nonatomic,copy)NSString *starCurrent;
@property (nonatomic,copy)NSString *starOverall;
@property (nonatomic,copy)NSString *ratingOverall;
@property (nonatomic,copy)NSString *downloads;
@property (nonatomic,copy)NSString *currentPrice;
@property (nonatomic,copy)NSString *lastPrice;
@property (nonatomic,copy)NSString *priceTrend;
@property (nonatomic,copy)NSString *expireDatetime;
@property (nonatomic,copy)NSString *releaseNotes;
@property (nonatomic,copy)NSString *updateDate;
@property (nonatomic,copy)NSString *fileSize;
@property (nonatomic,copy)NSString *ipa;
@property (nonatomic,copy)NSString *shares;
@property (nonatomic,copy)NSString *favorites;

/*
 "applicationId": "455680974",
 "slug": "rhythm-repeat",
 "name": "节奏重复",
 "releaseDate": "2014-07-01",
 "version": "2.3",
 "description": "界面清新简单的音乐节奏游戏。游戏的操作非常简单，只需根据提示依次点击相应的图标即可，共有三种乐曲选择。",
 "categoryId": 6014,
 "categoryName": "Game",
 "iconUrl": "http://photo.candou.com/i/114/55b07f3725eae8b3cafc9bce10d16e46",
 "itunesUrl": "http://itunes.apple.com/cn/app/rhythm-repeat/id455680974?mt=8",
 "starCurrent": "4.0",
 "starOverall": "4.0",
 "ratingOverall": "0",
 "downloads": "3640",
 "currentPrice": "0",
 "lastPrice": "12",
 "priceTrend": "limited",
 "expireDatetime": "2015-07-27 23:56:53.0",
 "releaseNotes": "Multi-Touch bug fixed",
 "updateDate": "2014-10-17 15:45:27",
 "fileSize": "16.69",
 "ipa": "1",
 "shares": "390",
 "favorites": "273"
 */


@end
