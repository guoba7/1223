//
//  ReduceCell.m
//  Limit_1509
//
//  Created by gaokunpeng on 15/7/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ReduceCell.h"
#import "UIImageView+WebCache.h"

@implementation ReduceCell

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
    self.titleLabel.text = model.name;
    //现价
    self.curPriceLabel.text = [NSString stringWithFormat:@"现价:￥%@",model.currentPrice];
    //原价
    NSString *lastPrice = [NSString stringWithFormat:@"￥:%@",model.lastPrice];
    
    //NSStrikethroughStyleAttributeName表示在文字上面加横线
    //@1==[NSNumber numberWithInt:1]
    //表示横线的高度为1
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
