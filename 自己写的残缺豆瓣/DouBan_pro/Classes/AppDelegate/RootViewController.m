//
//  RootViewController.m
//  DouBan_pro
//
//  Created by ws on 16/6/1.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "RootViewController.h"
#import "ActivityListController.h"
#import "MovieListController.h"
#import "CinemaListController.h"
#import "UserViewController.h"
#import "Color_macro.h"
#import "CustomTabBar.h"
#import "UIImage+ImageContentWithColor.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationController.navigationBar.backgroundColor = THEME_COLOR;
    
    
    //设置主题颜色
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:THEME_COLOR] forBarMetrics:UIBarMetricsDefault];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:THEME_COLOR] ];
    
    
    
    
    
    //设置tabbar 文本的标题颜色
    [self setTabBarTextAtrribute];
    //添加4个子视图控制器
    [self creatChildViewControllers];
    //获取 自定义 TabBar
    [self setCustomTabBar];
    
    
}

//设置 tabbar 文本的标题颜色
- (void)setTabBarTextAtrribute{
    //设置普通状态下,文本的标题颜色
    NSMutableDictionary * normalDic = [NSMutableDictionary dictionary];
    
    normalDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //设置选中状态下,文本标题的颜色
    NSMutableDictionary * selectDic = [NSMutableDictionary dictionary];
    selectDic[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    //配置文本属性
    UITabBarItem * tabBarItem = [UITabBarItem appearance];
    //正常状态下
    [tabBarItem setTitleTextAttributes:normalDic forState:(UIControlStateNormal)];
    //选中状态下
    [tabBarItem setTitleTextAttributes:selectDic forState:(UIControlStateSelected)];
    
    
    
}

/**
 *  给 TabBarController 添加一个子视图控制器
 *
 *  @param viewController 添加的子视图控制器
 *  @param title          名称
 *  @param normalImage    普通状态下显示的图片
 *  @param selectImage    选中状态下显示的图片
 */

- (void)addOneChildViewController:(UIViewController *)viewController Title:(NSString *)title NormalImage:(NSString *)normalImage SelectImage:(NSString *)selectImage{
    
    //给子视图控制器的 tabbarItem 赋值
    
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:normalImage];
    
    UIImage * image = [UIImage imageNamed:selectImage];
    //选中状态下的实现 设置渲染模式
    image = [image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    
    viewController.tabBarItem.selectedImage = image;
    
    //把子视图控制器添加上去
    [self addChildViewController:viewController];
    
    
}

- (void)creatChildViewControllers{
    //活动页面
    ActivityListController * activituListC = [[ActivityListController alloc]initWithStyle:(UITableViewStylePlain)];
    [self addOneChildViewController:[[UINavigationController alloc] initWithRootViewController:activituListC] Title:@"活动" NormalImage:@"2image" SelectImage:@"2imageH"];
    
    //电影
    CinemaListController * cinemaListC = [[CinemaListController alloc]initWithStyle:(UITableViewStylePlain)];
    [self addOneChildViewController:[[UINavigationController alloc] initWithRootViewController:cinemaListC] Title:@"电影" NormalImage:@"paper" SelectImage:@"paperH"];
    
    //影院
    MovieListController * movieListC = [[MovieListController alloc]initWithStyle:(UITableViewStylePlain)];
    [self addOneChildViewController:[[UINavigationController alloc] initWithRootViewController:movieListC] Title:@"影院" NormalImage:@"video" SelectImage:@"videoH"];
    
    //个人
    UserViewController * userVC = [[UserViewController alloc]init];
    [self addOneChildViewController:[[UINavigationController alloc] initWithRootViewController:userVC] Title:@"和人中心" NormalImage:@"person" SelectImage:@"personH"];
    
    
}

- (void)setCustomTabBar{
    [self setValue:[[CustomTabBar alloc] init] forKey:@"tabBar"];
}



@end
