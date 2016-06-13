//
//  CinemaCell.m
//  DouBan_pro
//
//  Created by ws on 16/6/1.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "CinemaCell.h"
#import "UIImageView+WebCache.h"


@implementation CinemaCell
////赋值

- (void)setCinemaModel:(CinemaModel *)cinemaModel{
    
    _upDateLb.text = [NSString stringWithFormat:@"上映时间: %@",cinemaModel.pubdate];
    _starLb.text = [NSString stringWithFormat:@"星级: %@",cinemaModel.stars];
    
    //根据第三方方法获取model里的URL的图片,没有的用占位图
    [self.cinemaImageV sd_setImageWithURL:[NSURL URLWithString:cinemaModel.images[@"small"]] placeholderImage:[UIImage imageNamed:@"1"]];
    NSLog(@"%@",self.cinemaModel.images[@"small"]);
    
    _cinemaNameLb.text = cinemaModel.title;
}


//- (void)layoutSubviews{
//    
//    _upDateLb.text = [NSString stringWithFormat:@"上映时间: %@",self.cinemaModel.pubdate];
//    _starLb.text = [NSString stringWithFormat:@"星级: %@",self.cinemaModel.stars];
//    
//    _cinemaNameLb.text = self.cinemaModel.title;
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
