//
//  X_HeaderView.m
//  X_Jiyibi
//
//  Created by Conquer on 16/6/14.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_HeaderView.h"
#import <Masonry.h>
@implementation X_HeaderView

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        // 创建视图并添加
//        
//        
//        
//    }
//    
//    
//}
// 重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 创建视图并添加
        _imgView = [UIImageView new];
        _imgView.image = [UIImage imageNamed:@"DefaultAvatar"];
        _balanceLable = [UILabel new];
        _balanceLable.text = @"净资产";
        _balanceLable.textAlignment = NSTextAlignmentCenter;  // 居中
        
        [self addSubview:_balanceLable];
        [self addSubview:_imgView];
        
        
        
        //给头像添加约束
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            // 与父视图中心点 X 坐标一样
            make.centerX.mas_equalTo(self.mas_centerX);
            // 在父视图中心点 Y 左边向上偏移15
            make.centerY.mas_equalTo(self.mas_centerY).offset(-15);
            make.size.mas_equalTo(CGSizeMake(70,70));
        }];
        // 给用户名添加约束
        [_balanceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            // 与父视图中心点X坐标 一样
            make.centerX.mas_equalTo(self.mas_centerX);
            
            make.top.equalTo(_imgView.mas_bottom).offset(5);
            
            make.size.mas_equalTo(CGSizeMake(150, 20));
            
        }];
        
    }
    return self;
}

@end
