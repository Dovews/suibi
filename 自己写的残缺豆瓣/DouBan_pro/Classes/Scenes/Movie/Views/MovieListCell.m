//
//  MovieListCell.m
//  Douban_pro
//
//  Created by hupan on 16/6/3.
//  Copyright © 2016年 hupan. All rights reserved.
//

#import "MovieListCell.h"

@implementation MovieListCell

//赋值
- (void)setMovieModel:(MovieModel *)movieModel{
    _movieName.text = movieModel.cinemaName;
    _movieAddress.text = movieModel.address;
    [_movieTelphone setTitle:movieModel.telephone forState:UIControlStateNormal];
}


//打电话
- (IBAction)telphoneAC:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", sender.titleLabel.text]]];
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
