//
//  Director.h
//  BuilderParttenDemo
//
//  Created by 乔杨 on 2018/4/4.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IProductBuilder.h"

@interface Director : NSObject

// 构造函数
- (instancetype)initWithBuilder:(id<IProductBuilder>)builder;

// 建造产品的方法
- (void)constructDrink:(NSString *)drink
                  food:(NSString *)food
                 snack:(NSString *)snack;

@end
