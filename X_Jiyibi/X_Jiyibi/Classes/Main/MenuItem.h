//
//  MenuItem.h
//  001_微博动画
//
//  Created by Saina on 16/6/9.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface MenuItem : NSObject

/*
 */
@property (strong, nonatomic) NSString *title;
/*
 */
@property (strong, nonatomic) UIImage *image;

//创建模型
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image;


@end
