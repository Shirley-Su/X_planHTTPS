//
//  MenuItem.m
//  001_微博动画
//
//  Created by Saina on 16/6/9.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem
//创建模型
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image
{
    MenuItem *itme = [[self alloc] init];
    
    itme.title = title;
    itme.image = image;
    
    return itme;
}
@end
