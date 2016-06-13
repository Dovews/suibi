//
//  ActivityCell.m
//  DouBan_pro
//
//  Created by ws on 16/6/2.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "ActivityCell.h"
#import "UIImageView+WebCache.h"

@implementation ActivityCell

////赋值
//
//- (void)setCinemaModel:(CinemaModel *)cinemaModel{
//    
//    _upDateLb.text = [NSString stringWithFormat:@"上映时间: %@",cinemaModel.pubdate];
//    _starLb.text = [NSString stringWithFormat:@"星级: %@",cinemaModel.stars];
//    
//    //根据第三方方法获取model里的URL的图片,没有的用占位图
//    [self.cinemaImageV sd_setImageWithURL:[NSURL URLWithString:cinemaModel.images[@"small"]] placeholderImage:[UIImage imageNamed:@"1"]];
//    NSLog(@"%@",self.cinemaModel.images[@"small"]);
//
//    _cinemaNameLb.text = cinemaModel.title;
//}

- (void)setActivityModel:(ActivityModel *)activityModel{
    
    _titleLb.text = activityModel.title;
    _beginWithEndTimeLb.text = [NSString stringWithFormat:@"%@ -- %@",activityModel.begin_time,activityModel.end_time];
    _addressLb.text = activityModel.address;
    
    _tagLb.text = activityModel.tags;
    
    _wisherCountLb.text = [NSString stringWithFormat:@"感兴趣:%ld",activityModel.wisher_count];
    _participantCountlb.text = [NSString stringWithFormat:@"参与:%ld",activityModel.participant_count];
    
    //根据第三方方法获取model里的URL的图片,没有的用占位图
    [self.headerImageV sd_setImageWithURL:[NSURL URLWithString:activityModel.large_advatar] placeholderImage:[UIImage imageNamed:@"1"]];
    //NSLog(@"%@",self.activityModel.images[@"small"]);

    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
