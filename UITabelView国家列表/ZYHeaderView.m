//
//  ZYHeaderView.m
//  UITabelView国家列表
//
//  Created by 章芝源 on 16/2/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYHeaderView.h"
#import "ZYCarModel.h"
@interface ZYHeaderView()
@property(nonatomic, strong)UILabel *label;
@end
@implementation ZYHeaderView


//设置
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        UILabel *label = [[UILabel alloc]init];
        self.label = label;
        label.text = self.car.title;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
      self = [[ZYHeaderView alloc]init];
    }
    return self;
}

//布局子控件
- (void)layoutSubviews
{
    self.label.frame = CGRectMake(20, 20, 50, 50);
}
@end
