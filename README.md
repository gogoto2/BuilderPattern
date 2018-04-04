# BuilderPattern
![](https://upload-images.jianshu.io/upload_images/3265534-ca672b1ac215ac04.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


使用多个简单的对象一步一步构建成一个复杂的对象。这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。
一个 Builder 类会一步一步构造最终的对象。该 Builder 类是独立于其他对象的。
### 介绍
**意图**：将一个复杂的构建与其表示相分离，使得同样的构建过程可以创建不同的表示。

**主要解决**：主要解决在软件系统中，有时候面临着"一个复杂对象"的创建工作，其通常由各个部分的子对象用一定的算法构成；由于需求的变化，这个复杂对象的各个部分经常面临着剧烈的变化，但是将它们组合在一起的算法却相对稳定。

**何时使用**：一些基本部件不会变，而其组合经常变化的时候。

**如何解决**：将变与不变分离开。

**关键代码**：建造者：创建和提供实例，导演：管理建造出来的实例的依赖关系。

**应用实例**： 1、去肯德基，汉堡、可乐、薯条、炸鸡翅等是不变的，而其组合是经常变化的，生成出所谓的"套餐"。 

**优点**： 1、建造者独立，易扩展。 2、便于控制细节风险。

**缺点**： 1、产品必须有共同点，范围有限制。 2、如内部变化复杂，会有很多的建造类。

**使用场景**： 1、需要生成的对象具有复杂的内部结构。 2、需要生成的对象内部属性本身相互依赖。

**注意事项**：与工厂模式的区别是：建造者模式更加关注与零件装配的顺序。
### 建造者模式：
#### 建模：       
![](https://upload-images.jianshu.io/upload_images/3265534-b6d10b69c99e4ca7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### Setp 1：
创建抽象产品协议 `<IProduct>`.
```
#import <Foundation/Foundation.h>

@protocol IProduct <NSObject>

// 饮料
- (void)drink:(NSString *)drink;
// 食物
- (void)food:(NSString *)food;
// 小吃
- (void)snack::(NSString *)snack;

@end
```
#### Setp 2：
创建具体的产品类 `KFCMeals` (实现了 `<IProduct>` 协议).
```
// .h 
#import <Foundation/Foundation.h>
#import "IProduct.h"

@interface KFCMeals : NSObject<IProduct>
@end

// .m
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
```
#### Setp 3：
创建抽象产品建造者协议 `<IProductBuilder>`.
```
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
```
#### Setp 4：
实现具体的产品类 `KFCMealsBuilder` (实现了 `<IProductBuilder>` 协议).
```
// .h
#import <Foundation/Foundation.h>
#import "IProductBuilder.h"

@interface KFCMealsBuilder : NSObject<IProductBuilder>
@end

// .m
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
```

#### Setp 5：
创建统一组装类 `Director` (可省略不实现).
```
// .h
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

// .m
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
```
#### Setp 6：测试
导入头文件 `#import "KFCMealsBuilder.h"` 和 `#import "Director.h"`

测试一：(有统一组装类的方法)

```
id<IProductBuilder> builder = [[KFCMealsBuilder alloc] init];
Director *dir = [[Director alloc] initWithBuilder:builder];
[dir constructDrink:@"牛奶" food:@"汉堡" snack:@"薯条"];
```
控制台打印结果：     
![](https://upload-images.jianshu.io/upload_images/3265534-08b405aea3c0b277.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

测试二：(无统一组装类的方法)
*开发中大多数情况下都是使用的该种方案。*
```
id<IProductBuilder> builder = [[KFCMealsBuilder alloc] init];
[[[[builder buildDrink:@"牛奶"] buildSnack:@"鸡块"] buildFood:@"鸡肉卷"] buildMeals];
```
控制台打印结果：       
![](https://upload-images.jianshu.io/upload_images/3265534-f611476bf92fb09d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***
到此建造者模式就完成了，如果有不同的见解欢迎讨论~
***

千里之行，始于足下。





