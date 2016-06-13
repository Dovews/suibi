//
//  FileHandle.m
//  DouBan_pro
//
//  Created by ws on 16/6/6.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "FileHandle.h"

//存储对象类型
#define KUserDef(object,key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]

//存储布尔类型
#define KBoolDef(object,key) [[NSUserDefaults standardUserDefaults] setBool:object forKey:key]

//获取对象类型
#define KGetUserDef(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

//获取布尔类型
#define KGetBoolDef(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]


@implementation FileHandle

/**
 *  存储用户信息
 *
 *  @param userModel 一个用户对象
 */
+ (void)saveUserInfo:(UserModel *)userModel{
    KUserDef(userModel.userName, @"userName");
    KUserDef(userModel.password, @"passWord");
    KUserDef(userModel.avatar, @"avatar");
    KBoolDef(userModel.loginState, @"loginState");
    
}


/**
 *  获取用户信息
 *
 *  @return 返回一个用户对象,里面包含一个用户的所有信息
 */
+ (UserModel *)getUserInfo{
    
    UserModel * userModel = [UserModel new];
    //通过用户对象来获取用户信息
    userModel.userName = KGetUserDef(@"userName");
    userModel.password = KGetUserDef(@"passWord");
    userModel.avatar = KGetUserDef(@"avatar");
    
    userModel.loginState = KGetBoolDef(@"loginState");
    
    return userModel;
    
}

/**
 *  删除用户信息
 */
+ (void)removeUserInfo{
    
    KUserDef(nil, @"userName");
    KUserDef(nil, @"passWord");
    KUserDef(nil, @"avatar");
    KBoolDef(nil, @"loginState");
}




@end
