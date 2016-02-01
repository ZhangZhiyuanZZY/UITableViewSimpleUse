//
//  ZYCarModel.h
//  UITabelView国家列表
//
//  Created by 章芝源 on 16/1/29.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYCarModel : NSObject
//描述
@property(copy, nonatomic)NSString *desc;
//title
@property(nonatomic, copy)NSString *title;
//汽车名字数组
@property(nonatomic, strong)NSArray *cars;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
