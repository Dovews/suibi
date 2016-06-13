//
//  ActivityModel.m
//  DouBan_pro
//
//  Created by ws on 16/6/2.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
