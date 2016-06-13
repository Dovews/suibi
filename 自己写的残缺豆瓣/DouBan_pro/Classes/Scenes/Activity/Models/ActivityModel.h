//
//  ActivityModel.h
//  DouBan_pro
//
//  Created by ws on 16/6/2.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityModel : NSObject

//标题
@property(nonatomic,copy)NSString * title;

//开始时间
@property(nonatomic,copy)NSString * begin_time;

//结束时间
@property(nonatomic,copy)NSString * end_time;

//地点
@property(nonatomic,copy)NSString * address;

//详情界面用的标签 跟 列表界面的 类型似的
@property(nonatomic,strong)NSString * tags;

//感兴趣 人数
@property(nonatomic,assign)NSInteger wisher_count;

//参加 人数
@property(nonatomic,assign)NSInteger participant_count;

//作者
@property(nonatomic,strong)NSDictionary * owner;

//id
@property(nonatomic,copy)NSString * ID;

//活动介绍
@property(nonatomic,copy)NSString * content;

//列表界面头像
@property(nonatomic,strong)NSString * large_advatar;




@end
