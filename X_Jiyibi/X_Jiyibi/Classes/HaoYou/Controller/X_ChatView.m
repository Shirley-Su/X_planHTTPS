//
//  X_ChatView.m
//  X_Jiyibi
//
//  Created by lanou3g on 16/6/14.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_ChatView.h"

@interface X_ChatView ()
@property(strong,nonatomic)UITextField *draftTF;
@property(strong,nonatomic)UIButton *sendBtn;
@end


@implementation X_ChatView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self setupWithFrame:frame];
    }
    return self;
}

- (void)setupWithFrame:(CGRect)frame {

    [self setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];

    self.draftTF = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, frame.size.width - 100, frame.size.height - 10)];
    [self.draftTF setBorderStyle:(UITextBorderStyleRoundedRect)];
    [self.draftTF setPlaceholder:@"说点什么呢"];
    [self.draftTF setFont:[UIFont systemFontOfSize:13]];
    [self addSubview:self.draftTF];

    self.sendBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.sendBtn setFrame:CGRectMake(frame.size.width - 90, 5, 85, frame.size.height - 10)];
    [self.sendBtn setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:128 / 255.0 alpha:1]];
    [self.sendBtn setTitle:@"发送" forState:(UIControlStateNormal)];
    [self.sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.sendBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [self.sendBtn.layer setMasksToBounds:YES];
    [self.sendBtn.layer setCornerRadius:4];
    [self.sendBtn addTarget:self action:@selector(didSendButtonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:self.sendBtn];
}

- (void)didSendButtonClicked:(UIButton *)sender {

    if (self.buttonClicked) {
        self.buttonClicked(self.draftTF.text);
    }
    self.draftTF.text = @"";
}

- (NSString *)draftText {

    return self.draftTF.text;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
