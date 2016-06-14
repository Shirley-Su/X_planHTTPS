//
//  X_LoginViewController.h
//  X_Jiyibi
//
//  Created by Saina on 16/6/13.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface X_LoginViewController : UIViewController
//登录按钮
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

//用户名
@property (weak, nonatomic) IBOutlet UITextField *accountField;
//密码
@property (weak, nonatomic) IBOutlet UITextField *pwdField;

//记住密码
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;

//自动登录
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@end
