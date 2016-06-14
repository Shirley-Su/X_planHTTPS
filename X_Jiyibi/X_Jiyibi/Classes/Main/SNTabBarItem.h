//
//  SNTabBarItem.h
//  003_彩票
//
//  Created by Saina on 16/6/10.
//  Copyright © 2016年 Saina. All rights reserved.
//


//模仿下系统的tabBar, 里面的按钮有子控制器决定

#import <UIKit/UIKit.h>

@class SNTabBarItem;


@protocol SNTabBarItemDelegate <NSObject>

@optional
-(void) tabBar:(SNTabBarItem *)tabBar didClickBtn:(NSInteger)index;

@end


@interface SNTabBarItem : UIView

/*
 按钮的个数*/
//@property (assign, nonatomic) int itemCount;

/*
 模型数组*/
@property (strong, nonatomic) NSArray *items;
@property(nonatomic, weak)id<SNTabBarItemDelegate> delegate;


@end
