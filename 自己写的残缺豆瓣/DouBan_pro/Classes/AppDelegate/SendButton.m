//
//  SendButton.m
//  DouBan_pro
//
//  Created by ws on 16/6/1.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "SendButton.h"

@implementation SendButton


//创建按钮的类方法
+ (instancetype)creatButton{
    SendButton * button = [SendButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"post_normal@2x"] forState:(UIControlStateNormal)];
//    [button addTarget:self action:@selector(touchAC) forControlEvents:(UIControlEventTouchUpInside)];
    return button;
}

//- (void)touchAC{
//    NSLog(@"发送东西了");
//}

@end
