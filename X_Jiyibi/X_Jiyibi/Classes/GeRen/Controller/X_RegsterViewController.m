//
//  X_RegsterViewController.m
//  X_Jiyibi
//
//  Created by Saina on 16/6/14.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_RegsterViewController.h"
#import <EaseMob.h>
#import "MBProgressHUD+XMG.h"
#import "X_LoginViewController.h"
@interface X_RegsterViewController ()

@end

@implementation X_RegsterViewController
@synthesize passwordTextField,usernameTextField, passwordTX;
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"注册";


}
- (IBAction)didRegisterClicged:(UIButton *)sender {
   
    //用户注册的异步block方法
    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:self.usernameTextField.text password:self.passwordTextField.text  withCompletion:^(NSString *username, NSString *password, EMError *error) {
        if (usernameTextField.text == nil || passwordTextField.text == nil || passwordTX.text == nil) {
            [MBProgressHUD showError:@"账号或者密码是空"];
        }else if (![passwordTextField.text isEqualToString:passwordTX.text]){
            [MBProgressHUD showError:@"密码不一致"];
        }else{
            if (!error) {
                NSLog(@"注册成功");
                X_LoginViewController *loginVC = [[X_LoginViewController alloc]init];
                loginVC.accountField.text = self.usernameTextField.text;
                loginVC.pwdField.text = self.usernameTextField.text;
                
                [self.navigationController popViewControllerAnimated:YES];
            }
        }

    } onQueue:nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
