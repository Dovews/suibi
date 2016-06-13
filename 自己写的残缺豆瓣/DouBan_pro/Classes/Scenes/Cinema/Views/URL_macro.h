//
//  URL_macro.h
//  DouBan_pro
//
//  Created by ws on 16/6/2.
//  Copyright © 2016年 ws. All rights reserved.
//

#ifndef URL_macro_h
#define URL_macro_h

//电影列表URL

#define CINEMA_LIST_URL @"http://api.douban.com/v2/movie/nowplaying?app_name=doubanmovie&client=e:iPhone4,1%7Cy:iPhoneOS_6.1%7Cs:mobile%7Cf:doubanmovie_2%7Cv:3.3.1%7Cm:PP_market%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%E5%8C%97%E4%BA%ACversion=2&start=0&apikey=0df993c66c0c636e29ecbb5344252a4a"


#define CINEMA_INFO_URL1 @"http://api.douban.com/v2/movie/subject/"

#define CINEMA_INFO_URL2 @"?apikey=0df993c66c0c636e29ecbb5344252a4a&client=e:iPhone4,1%7Cy:iPhoneOS_6.1%7Cs:mobile%7Cf:doubanmovie_2%7Cv:3.3.1%7Cm:PP_market%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%E5%8C%97%E4%BA%AC&version=2&app_name=doubanmovie"




//活动界面URL

#define ACTIVITY_LIST_URL @"http://api.douban.com/v2/event/list?type=all&district=all&loc=108288&photo_cate=image&photo_count=5&start=0&day_type=future&apikey=062bcf31694a52d212836d943bdef876"


//影院接口
#define MOVIE_LIST_URL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/cinemalist.php"


//登录接口
#define USER_LOGIN_URL @"http://162.211.125.85/douban/user.php/DLogin"

//注册接口
#define USER_REGISTER_URL @"http://162.211.125.85/douban/user.php/DRegister"

//图片根目录
#define USER_AVATAR_LOCAL_URL @"http://162.211.125.85"


#endif /* URL_macro_h */
