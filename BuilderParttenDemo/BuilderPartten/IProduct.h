//
//  IProduct.h
//  BuilderParttenDemo
//
//  Created by Joeyoung on 2018/4/4.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IProduct <NSObject>

// 饮料
- (void)drink:(NSString *)drink;
// 食物
- (void)food:(NSString *)food;
// 小吃
- (void)snack:(NSString *)snack;

@end
