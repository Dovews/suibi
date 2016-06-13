//
//  CinemaCell.h
//  DouBan_pro
//
//  Created by ws on 16/6/1.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cinemaImageV;

@property (weak, nonatomic) IBOutlet UILabel *cinemaNameLb;

@property (weak, nonatomic) IBOutlet UILabel *starLb;

@property (weak, nonatomic) IBOutlet UILabel *upDateLb;


@property(nonatomic,strong)CinemaModel * cinemaModel;

@end
