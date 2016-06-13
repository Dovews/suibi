//
//  ActivityCell.h
//  DouBan_pro
//
//  Created by ws on 16/6/2.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

@interface ActivityCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@property (weak, nonatomic) IBOutlet UILabel *beginWithEndTimeLb;

@property (weak, nonatomic) IBOutlet UILabel *addressLb;

@property (weak, nonatomic) IBOutlet UILabel *tagLb;

//感兴趣
@property (weak, nonatomic) IBOutlet UILabel *wisherCountLb;

//参与
@property (weak, nonatomic) IBOutlet UILabel *participantCountlb;

@property (weak, nonatomic) IBOutlet UIImageView *headerImageV;

@property(nonatomic,strong)ActivityModel * activityModel;


@end
