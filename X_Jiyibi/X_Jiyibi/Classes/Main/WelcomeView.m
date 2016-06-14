//
//  WelcomeView.m
//  001_微博动画
//
//  Created by Saina on 16/6/9.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "WelcomeView.h"

@interface WelcomeView()
@property (weak, nonatomic) IBOutlet UIImageView *sloganView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;


@end

@implementation WelcomeView

//封装代码
+(instancetype)welcomeView{
    
    return [[NSBundle mainBundle] loadNibNamed:@"WelcomeView" owner:nil options:nil][0];
}

/**
 *  文字图片慢慢消失, ---alpha值
 *  显示头像, 头像网上移动的动画, 弹簧效果
 *  欢迎回来的文字, 慢慢显示---alpha值
 */

-(void)didMoveToSuperview{
    [super didMoveToSuperview];
    
    //切圆角
    _iconView.layer.masksToBounds = YES;
    _iconView.layer.cornerRadius = 50;
    
    //移动的位置
    _iconView.transform = CGAffineTransformMakeTranslation(0, 100);
    [UIView animateWithDuration:3 animations:^{
        _sloganView.alpha = 0;
    } completion:^(BOOL finished) {
        _iconView.hidden = NO;
        
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            //图片
            _iconView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            //文字慢慢显示
            _textLabel.alpha = 0;
            _textLabel.hidden = NO;
            
            [UIView animateWithDuration:2 animations:^{
                _textLabel.alpha = 1;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
            
        }];
    }];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
