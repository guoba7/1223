//
//  FreeCell.m
//  Limit_1509
//
//  Created by gaokunpeng on 15/7/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "FreeCell.h"
#import "UIImageView+WebCache.h"

@implementation FreeCell

-(void)configModel:(LimitModel *)model index:(NSInteger)index
{
    //背景图片
    if (index % 2 == 0) {
        self.bgImageView.image = [UIImage imageNamed:@"cate_list_bg1"];
    }else{
        self.bgImageView.image = [UIImage imageNamed:@"cate_list_bg2"];
    }
    //图片
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    
    //标题
    self.titleLabel.text = [NSString stringWithFormat:@"%ld:%@",index+1,model.name];
    //评分
    self.rateLabel.text = [NSString stringWithFormat:@"评分:%.1f",model.starCurrent.floatValue];
    //原价
    NSString *lastPrice = [NSString stringWithFormat:@"￥:%@",model.lastPrice];
    //横线的高度为1
    NSDictionary *dict = @{NSStrikethroughStyleAttributeName:@1};
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:lastPrice attributes:dict];
    self.lastPriceLabel.attributedText = string;
    
    //星级
    [self.myStarView setRating:model.starCurrent.floatValue];
    //类型
    self.typeLabel.text = model.categoryName;
    //分享
    self.shareLabel.text = [NSString stringWithFormat:@"分享:%@",model.shares];
    //收藏
    self.favoriteLabel.text = [NSString stringWithFormat:@"收藏:%@",model.favorites];
    //下载
    self.downloadLabel.text = [NSString stringWithFormat:@"下载:%@",model.downloads];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
