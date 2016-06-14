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

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"注册";


}
- (IBAction)didRegisterClicged:(UIButton *)sender {
    // 用户注册的异步Block方法
    
    if (_usernameTextField.text == nil || _passwordTextField.text == nil || _passwordTX.text == nil) {
        [MBProgressHUD showError:@"账号或者密码是空"];
    }else if (![_passwordTextField.text isEqualToString:_passwordTX.text]){
        [MBProgressHUD showError:@"密码不一致"];
    }else{
        [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:_usernameTextField.text password:_passwordTextField.text withCompletion:^(NSString *username, NSString *password, EMError *error) {
            
            if (!error) {
               
                    [self dismissViewControllerAnimated:YES completion:nil];
                [self.navigationController pushViewController:[[X_LoginViewController alloc]init] animated:YES];
                
               

                
            }
            
        } onQueue:dispatch_get_main_queue()];
        

    }
    
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
