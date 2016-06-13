//
//  ActivityDetailController.h
//  DouBan_pro
//
//  Created by ws on 16/6/2.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

@interface ActivityDetailController : UIViewController

@property(nonatomic,strong)ActivityModel * activityModel;

@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@property (weak, nonatomic) IBOutlet UILabel *beginWithendLb;


@property (weak, nonatomic) IBOutlet UILabel *owerName;

@property (weak, nonatomic) IBOutlet UILabel *typeLb;

@property (weak, nonatomic) IBOutlet UILabel *addressLb;

@property (weak, nonatomic) IBOutlet UILabel *contentLb;
@end
