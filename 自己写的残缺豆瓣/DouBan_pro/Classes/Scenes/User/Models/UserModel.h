//
//  UserModel.h
//  DouBan_pro
//
//  Created by ws on 16/6/6.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property(nonatomic,copy)NSString * userName; //用户名

@property(nonatomic,copy)NSString * password; //密码

@property(nonatomic,copy)NSString * avatar; //头像


@property(nonatomic,assign)BOOL loginState;//登录状态

@end
