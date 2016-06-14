//
//  SNTabBarItem.m
//  003_彩票
//
//  Created by Saina on 16/6/10.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "SNTabBarItem.h"
#import "SNTabBarButton.h"



@interface SNTabBarItem ()
@property(nonatomic, weak)SNTabBarButton *selButton;

@end


@implementation SNTabBarItem
//我们自己的tabBar的按钮也需要模型来管理, 

-(void)setItems:(NSArray *)items{
    _items = items;
    
    //保存按钮的图片
    for (UITabBarItem *item in items) {
        SNTabBarButton *btn = [SNTabBarButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = self.subviews.count;
        
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        //添加监听
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        if (self.subviews.count == 1) {
            [self btnClick:btn];
        }

    }

}
-(void)btnClick:(SNTabBarButton *)button{
    _selButton.selected = NO;
    
    button.selected = YES;
    
    _selButton = button;
    
    //通知tabBar切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [_delegate tabBar:self didClickBtn:button.tag];
    }
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    int count = (int)self.subviews.count;
    
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat W = [UIScreen mainScreen].bounds.size.width / count;
    
    CGFloat H = self.bounds.size.height;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        X = i * W;
        btn.frame = CGRectMake(X, Y, W, H);
    }
}

-(void)setUp{
    
    }


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
