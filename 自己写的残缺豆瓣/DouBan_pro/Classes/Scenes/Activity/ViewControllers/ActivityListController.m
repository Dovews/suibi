//
//  ActivityListController.m
//  DouBan_pro
//
//  Created by ws on 16/6/1.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "ActivityListController.h"
#import "URL_macro.h"
#import "GiFHUD.h"
#import "ActivityCell.h"
#import "ActivityDetailController.h"
#import "ActivityModel.h"

@interface ActivityListController ()
//装所有电影的数组(数据源)
@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation ActivityListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"活动";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ActivityCell" bundle:nil] forCellReuseIdentifier:@"Activity_Cell"];
    
    
    
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
    NSURL * url = [NSURL URLWithString:ACTIVITY_LIST_URL];
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
        
        
        if (dic[@"count"] != 0) {
            NSArray * array1 = dic[@"events"];
            for (NSDictionary * dict in array1) {
                ActivityModel * activityModel = [ActivityModel new];
                [activityModel setValuesForKeysWithDictionary:dict];
                [weskSelf.dataArray addObject:activityModel];
                
                [weskSelf.dataArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    ActivityModel * activityModel1 = (ActivityModel *)obj1;
                    ActivityModel * activityModel2 = (ActivityModel *)obj2;
                    
                    return [activityModel2.begin_time compare:activityModel1.begin_time];
                    
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
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Activity_Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[ActivityCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Activity_Cell"];
    }
    
    ActivityModel * activityModel = self.dataArray[indexPath.row];
    cell.activityModel = activityModel;
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityDetailController * activityDeatilC = [[ActivityDetailController alloc]init];
    activityDeatilC.activityModel = self.dataArray[indexPath.row];
    
    [self.navigationController pushViewController:activityDeatilC animated:YES];
}


@end
