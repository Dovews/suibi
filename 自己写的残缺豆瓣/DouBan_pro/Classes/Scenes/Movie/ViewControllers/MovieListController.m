//
//  MovieListController.m
//  DouBan_pro
//
//  Created by ws on 16/6/1.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "MovieListController.h"
#import "GiFHUD.h"
#import "MovieModel.h"
#import "MovieListCell.h"
#import "URL_macro.h"

@interface MovieListController ()

@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation MovieListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数组
    self.dataArray = [NSMutableArray array];
    
    [self sendRequest];
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieListCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
    
    
}


- (void)setUpGifHUD{
    [GiFHUD setGifWithImageName:@"pika.gif"];
    [GiFHUD show];
    
}

//发起请求
- (void)sendRequest{
    
    NSURL * url = [NSURL URLWithString:MOVIE_LIST_URL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    //发起请求
    __weak typeof(self) weakSelf = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //显示皮卡丘
        [weakSelf setUpGifHUD];
        
        if (!data) {
            return ;
        }
        
        //解析数据
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil][@"result"];
        
        NSLog(@"%@",dic);
        //拿到装有影院信息的数组
        NSArray * sourceArr = dic[@"data"];
        for (NSDictionary * dict in sourceArr) {
            MovieModel * movieMoel = [MovieModel new];
            [movieMoel setValuesForKeysWithDictionary:dict];
            [weakSelf.dataArray addObject:movieMoel];
            NSLog(@"%@",movieMoel.address);
        }
        //回到主线程 刷新UI
       dispatch_async(dispatch_get_main_queue(), ^{
           //隐藏皮卡丘
           [GiFHUD dismiss];
           [weakSelf.tableView reloadData];
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
    NSLog(@"-----%ld-----",self.dataArray.count);
    return self.dataArray.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    if (cell) {
        cell = [[MovieListCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"myCell"];
        
    }
    
    MovieModel * movieModel = self.dataArray[indexPath.row];
    cell.movieModel = movieModel;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 123;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"9000");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
