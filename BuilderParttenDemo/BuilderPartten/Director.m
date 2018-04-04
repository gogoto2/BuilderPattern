//
//  Director.m
//  BuilderParttenDemo
//
//  Created by 乔杨 on 2018/4/4.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "Director.h"

@interface Director()

@property (nonatomic, strong)id<IProductBuilder> builder;

@end

@implementation Director

- (instancetype)initWithBuilder:(id<IProductBuilder>)builder {
    if (self = [super init]) {
        _builder = builder;
    }
    return self;
}

- (void)constructDrink:(NSString *)drink
                  food:(NSString *)food
                 snack:(NSString *)snack {
    
    [[[[_builder buildDrink:drink] buildFood:food] buildSnack:snack] buildMeals];
}

@end
