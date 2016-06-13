//
//  CinemaDeatilController.m
//  DouBan_pro
//
//  Created by ws on 16/6/1.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "CinemaDeatilController.h"
#import "URL_macro.h"
#import "GiFHUD.h"
#import "UIImageView+WebCache.h"


@interface CinemaDeatilController ()

@property (weak, nonatomic) IBOutlet UIImageView *cinemaImage;

@property (weak, nonatomic) IBOutlet UILabel *ratingLb;//评分

@property (weak, nonatomic) IBOutlet UILabel *pubdateLb;//上映日期


@property (weak, nonatomic) IBOutlet UILabel *durationLb;//时长

@property (weak, nonatomic) IBOutlet UILabel *genresLb;//类型

@property (weak, nonatomic) IBOutlet UILabel *countryLb;//国家

@property (weak, nonatomic) IBOutlet UILabel *summaryLb;//简介



@end

@implementation CinemaDeatilController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self sendRequestAdnGetData];
    
    self.title = self.cinemaModel.title;
    
}


//加载皮卡丘
- (void)setUpGifHUD{
    //给皮卡丘指定图片
    [GiFHUD setGifWithImageName:@"pika.gif"];
    //显示皮卡丘
    [GiFHUD show];
}

//发起请求
- (void)sendRequestAdnGetData{
    //拼接URL
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", CINEMA_INFO_URL1, _cinemaModel.ID, CINEMA_INFO_URL2]];
    //创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //发起请求
    __weak typeof (self) weakSelf = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        //显示皮卡丘
        [self setUpGifHUD];
        
        if (data == nil) {
            return;
        }
        
        //解析数据
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //转换成模型对象
        CinemaModel *cinemaModel = [CinemaModel new];
        [cinemaModel setValuesForKeysWithDictionary:dic];
        //回到主线程,刷新 UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf updateSubViews:cinemaModel];
            [GiFHUD dismiss];
        });
    }];
}
 

- (void)updateSubViews:(CinemaModel *)cinemaModel{
    
    [_cinemaImage sd_setImageWithURL:[NSURL URLWithString:cinemaModel.images[@"large"]] placeholderImage:[UIImage imageNamed:@"1"]];
    
    
    _ratingLb.text = [NSString stringWithFormat:@"评分:%@ (%ld评论)",cinemaModel.rating[@"average"],cinemaModel.useful_count];
    _pubdateLb.text = cinemaModel.pubdate;
    _genresLb.text = [self getStringWithArray:cinemaModel.genres];
    _countryLb.text = [self getStringWithArray:cinemaModel.countries];
    _durationLb.text = [self getStringWithArray:cinemaModel.durations];
    
    //简介
    _summaryLb.text = cinemaModel.summary;
    
}


//数组转化成字符串
- (NSString *)getStringWithArray:(NSArray *)array{
    
    NSMutableString * str = [NSMutableString string];
    
    for (id objc in array) {
        [str appendFormat:@"%@",objc];
    }
    
    return str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
