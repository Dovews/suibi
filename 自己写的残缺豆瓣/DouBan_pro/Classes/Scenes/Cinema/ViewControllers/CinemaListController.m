//
//  CinemaListController.m
//  DouBan_pro
//
//  Created by ws on 16/6/1.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "CinemaListController.h"
#import "CinemaCell.h"
#import "CinemaDeatilController.h"
#import "URL_macro.h"
#import "GiFHUD.h"
#import "CinemaModel.h"

@interface CinemaListController ()
//装所有电影的数组(数据源)
@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation CinemaListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"电影";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CinemaCell" bundle:nil] forCellReuseIdentifier:@"cinema_cell"];
    
    
    
    self.dataArray = [NSMutableArray array];
    [self sendRequestAndGetData];
    
}
//加载皮卡丘
- (void)setUpGifHUD{
    //给皮卡丘指定图片
    [GiFHUD setGifWithImageName:@"pika.gif"];
    //显示皮卡丘
    [GiFHUD show];
}
//发起网络请求并获取数据
- (void)sendRequestAndGetData{
    //拼接URL
    NSURL * url = [NSURL URLWithString:CINEMA_LIST_URL];
    //创建请求对象
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    //创建连接对象,发起请求,获得数据
    //弱引用,不让相互持久
    __weak typeof(self) weskSelf = self;
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //显示皮卡丘
        [weskSelf setUpGifHUD];
        if(data == nil){
            return ;
        }
        
        //解析数据
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        
        //判断是否可以进行数据的获取
        if([dic[@"total"] integerValue] != 0){
            NSArray * allCinemaArr = dic[@"entries"];
            for (NSDictionary * dic1 in allCinemaArr) {
                CinemaModel * cinemaModel = [CinemaModel new];
                [cinemaModel setValuesForKeysWithDictionary:dic1];
                //把电影模型装入数据源数据
                [weskSelf.dataArray addObject:cinemaModel];
                //根据上映诗经对电影模型进行排序
                [weskSelf.dataArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    CinemaModel * cinemaModel1 = (CinemaModel *)obj1;
                    CinemaModel * cinemaModel2 = (CinemaModel *)obj2;
                    
                    return [cinemaModel2.pubdate compare:cinemaModel1.pubdate];
                    
                    
                }];
            }
        }
        
        //拿到数据,回到主线程刷新 UI
        dispatch_async(dispatch_get_main_queue(), ^{
            //刷新表
            [self.tableView reloadData];
            //隐藏皮卡丘
            [GiFHUD dismiss];
        });
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cinema_cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CinemaCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cinema_cell"];
    }

    CinemaModel * cinemaModel = self.dataArray[indexPath.row];
    cell.cinemaModel = cinemaModel;

    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 123;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CinemaDeatilController * cinemaDeatilC = [[CinemaDeatilController alloc]init];
    cinemaDeatilC.cinemaModel = self.dataArray[indexPath.row];

    [self.navigationController pushViewController:cinemaDeatilC animated:YES];
}



@end
