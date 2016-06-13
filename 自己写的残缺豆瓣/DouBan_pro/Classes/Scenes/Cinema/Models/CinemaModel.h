//
//  CinemaModel.h
//  DouBan_pro
//
//  Created by ws on 16/6/2.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CinemaModel : NSObject
//属性
@property(nonatomic,strong)NSString * title;//电影名称
@property(nonatomic,strong)NSString * stars;//电影星级
@property(nonatomic,strong)NSString * pubdate;//上映时间
@property(nonatomic,strong)NSDictionary * images;//电影的所有图片



@property(nonatomic,copy)NSString * ID;//电影ID
@property(nonatomic,strong)NSDictionary * rating;//评分
@property(nonatomic,copy)NSString * summary;//简介
@property(nonatomic,strong)NSArray * genres;//分类
@property(nonatomic,strong)NSArray * countries;//国家
@property(nonatomic,strong)NSArray * durations; //时长

@property(nonatomic,assign)NSInteger useful_count;//评论数




@end
