//
//  IProductBuilder.h
//  BuilderParttenDemo
//
//  Created by Joeyoung on 2018/4/4.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IProduct.h"

@protocol IProductBuilder <NSObject>

// 建造饮料
- (id<IProductBuilder>)buildDrink:(NSString *)drink;
// 建造食物
- (id<IProductBuilder>)buildFood:(NSString *)food;
// 建造小吃
- (id<IProductBuilder>)buildSnack:(NSString *)snack;
// 建造套餐
- (id<IProduct>)buildMeals;

@end
