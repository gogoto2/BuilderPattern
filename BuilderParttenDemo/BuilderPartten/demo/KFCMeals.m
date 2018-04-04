//
//  KFCMeals.m
//  BuilderParttenDemo
//
//  Created by 乔杨 on 2018/4/4.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "KFCMeals.h"

@implementation KFCMeals

// 饮料
- (void)drink:(NSString *)drink {
    NSLog(@"选取KFC饮料为：%@",drink);
}
// 食物
- (void)food:(NSString *)food {
    NSLog(@"选取KFC食物为：%@",food);
}
// 小吃
- (void)snack:(NSString *)snack {
    NSLog(@"选取KFC小吃为：%@",snack);
}

@end
