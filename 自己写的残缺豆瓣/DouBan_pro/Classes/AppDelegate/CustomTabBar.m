//
//  CustomTabBar.m
//  DouBan_pro
//
//  Created by ws on 16/6/1.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "CustomTabBar.h"

@implementation CustomTabBar

//重写初始化方法,把sendBt加上去
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.sendBt = [SendButton creatButton];
        [self addSubview:_sendBt];
    }
    return self;
}

//重新给子视图布局
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //获取 tabbar 的宽 和 高
    CGFloat barWidth = self.frame.size.width;
    CGFloat barHeight = self.frame.size.height;
    
    //确定按钮的 frame
    CGFloat buttonY = 1;
    CGFloat buttonW = barWidth / 5;
    CGFloat buttonH = barHeight;
    
    //按钮的索引
    NSInteger index = 0;
    
    
    //self.sendBt.center = CGPointMake(barWidth / 2, barHeight * 0.3);
    
    self.sendBt.frame = CGRectMake(barWidth / 2 - buttonW / 2, -20, buttonW, buttonH);
    
    [self.sendBt addTarget:self action:@selector(sendAC) forControlEvents:(UIControlEventTouchUpInside)];
    
    for (UIView * view in self.subviews) {
        NSString * className = NSStringFromClass([view class]);
        
        //判断类是否为 @"UITabBarButton" ,如果是的话,设定它的 frame
        if ([className isEqualToString:@"UITabBarButton"]) {
            CGFloat buttonX = index * buttonW;
            
            
            if (index >= 2) {
                buttonX = buttonW + buttonX;
            }
            
            view.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            
            //确定第一个按钮之后,索引+1,继续确定第二个按钮的frame
            index ++;
        }
    }
    
}

- (void)sendAC{
    NSLog(@"好使的");
}

@end
