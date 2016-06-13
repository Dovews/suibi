//
//  MovieListCell.h
//  Douban_pro
//
//  Created by hupan on 16/6/3.
//  Copyright © 2016年 hupan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

@interface MovieListCell : UITableViewCell

@property (strong, nonatomic)MovieModel *movieModel; //model


@property (weak, nonatomic) IBOutlet UILabel *movieName;//影院名称


@property (weak, nonatomic) IBOutlet UILabel *movieAddress;//影院地址


@property (weak, nonatomic) IBOutlet UIButton *movieTelphone;//影院电话


@end
