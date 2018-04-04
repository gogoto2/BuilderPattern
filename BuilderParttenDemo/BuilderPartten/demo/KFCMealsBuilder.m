//
//  KFCMealsBuilder.m
//  BuilderParttenDemo
//
//  Created by Joeyoung on 2018/4/4.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "KFCMealsBuilder.h"
#import "KFCMeals.h"

@interface KFCMealsBuilder()

@property (nonatomic ,strong)id<IProduct> meals;

@end

@implementation KFCMealsBuilder

// 套餐建造者 持有 套餐 的引用
- (instancetype)init {
    if (self = [super init]) {
        _meals = [[KFCMeals alloc] init];
    }
    return self;
}

// 这种链式调用就是典型的Builder的应用

// 建造饮料
- (id<IProductBuilder>)buildDrink:(NSString *)drink {
    
    [_meals drink:drink];
    return self;
}
// 建造食物
- (id<IProductBuilder>)buildFood:(NSString *)food {
    
    [_meals food:food];
    return self;
}
// 建造小吃
- (id<IProductBuilder>)buildSnack:(NSString *)snack {
 
    [_meals snack:snack];
    return self;
}
// 建造套餐
- (id<IProduct>)buildMeals {
    NSLog(@"生成了一个KFC套餐。");
    
    return _meals;
}

@end
