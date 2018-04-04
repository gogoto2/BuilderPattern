//
//  ViewController.m
//  BuilderParttenDemo
//
//  Created by Joeyoung on 2018/4/4.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "ViewController.h"

#import "KFCMealsBuilder.h"
#import "Director.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self haveDirectorDemo];
    
    [self noDiretorDemo];
    
}
// 有统一建造者的方法
- (void)haveDirectorDemo {
    id<IProductBuilder> builder = [[KFCMealsBuilder alloc] init];
    Director *dir = [[Director alloc] initWithBuilder:builder];
    [dir constructDrink:@"牛奶" food:@"汉堡" snack:@"薯条"];
}
// 无统一建造者的方法
- (void)noDiretorDemo {
    id<IProductBuilder> builder = [[KFCMealsBuilder alloc] init];
    [[[[builder buildDrink:@"牛奶"] buildSnack:@"鸡块"] buildFood:@"鸡肉卷"] buildMeals];

}

@end
