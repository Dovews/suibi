//
//  UserHeaderView.m
//  DouBan_pro
//
//  Created by ws on 16/6/6.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "UserHeaderView.h"
#import <Masonry.h>


@implementation UserHeaderView

//重新 init 方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建视图,并添加
        _userImageV = [UIImageView new];
        _userImageV.image = [UIImage imageNamed:@"DefaultAvatar"];
        _userNameLb = [UILabel new];
        _userNameLb.text = @"未登录";
        _userNameLb.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_userNameLb];
        [self addSubview:_userImageV];
        
        
        
        
        
        //给头像添加约束
        [_userImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            //与父视图中心点 x 坐标一样
            make.centerX.mas_equalTo(self.mas_centerX);
            //与父视图中心点 y 坐标向上偏移15
            make.centerY.mas_equalTo(self.mas_centerY).with.offset(-15);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        //给用户名添加约束
        [_userNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            //与父视图中心点 x 坐标一样
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.equalTo(_userImageV.mas_bottom).with.offset(5);
            make.size.mas_equalTo(CGSizeMake(150, 20));
        }];
        
        
        
        
    }
    return self;
}


@end
