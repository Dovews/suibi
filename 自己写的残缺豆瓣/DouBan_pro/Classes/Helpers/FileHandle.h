//
//  FileHandle.h
//  DouBan_pro
//
//  Created by ws on 16/6/6.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface FileHandle : NSObject

/**
 *  存储用户信息
 *
 *  @param userModel 一个用户对象
 */
+ (void)saveUserInfo:(UserModel *)userModel;


/**
 *  获取用户信息
 *
 *  @return 返回一个用户对象,里面包含一个用户的所有信息
 */
+ (UserModel *)getUserInfo;

/**
 *  删除用户信息
 */
+ (void)removeUserInfo;

@end
