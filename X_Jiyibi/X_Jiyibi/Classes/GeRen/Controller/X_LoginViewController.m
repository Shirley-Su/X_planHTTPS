//
//  X_LoginViewController.m
//  X_Jiyibi
//
//  Created by Saina on 16/6/13.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_LoginViewController.h"
#import "MBProgressHUD+XMG.h"
#import "X_GRTableViewController.h"
#import "X_RegsterViewController.h"

#import <EaseMob.h>

@interface X_LoginViewController ()<EMChatManagerLoginDelegate>



@end

@implementation X_LoginViewController


// 在执行跳转之前的时候调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    UIViewController *vc = segue.destinationViewController;
    vc.title = [NSString stringWithFormat:@"%@的联系人列表", _accountField.text];
//    NSLog(@"%@--%@",segue.sourceViewController,segue.destinationViewController);
}

// 点击了登录按钮的时候调用
- (IBAction)login:(id)sender {
    

    
        BOOL isAutoLogin = [[EaseMob sharedInstance].chatManager isAutoLoginEnabled];
        if (!isAutoLogin) {
            [[EaseMob sharedInstance].chatManager asyncLoginWithUsername: self.accountField.text   password: self.pwdField.text completion:^(NSDictionary *loginInfo, EMError *error) {
                if (!error && loginInfo) {
                    NSLog(@"登录成功");
                    // 设置自动登录
                    //                [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:NO];
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            } onQueue:nil];
    
    }
    
}

// 显示警告控制器使用一个错误信息
# pragma mark - Error Alert Controller
- (void)showAlertControllerWithError:(EMError *)error {
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"登录失败" message:error.description preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * actionCancel = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:actionCancel];
    
    [self showDetailViewController:alertController sender:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self.view reloadInputViews];
}


// 记住密码开关状态改变的时候调用
- (IBAction)rmbPwdChange:(id)sender {
    // 如果取消记住密码，自动登录也需要取消勾选
    if (_rmbPwdSwitch.on == YES) {
        _accountField.text = [[X_RegsterViewController alloc]init].usernameTextField.text;
        _pwdField.text =[[X_RegsterViewController alloc]init].passwordTextField.text;
    }
   
    if (_rmbPwdSwitch.on == NO) { // 取消记住密码
        // 取消自动登录
        [_autoLoginSwitch setOn:NO animated:YES];
    }
    
    
}

// 自动登录开关状态改变的时候调用
- (IBAction)autoLoginChange:(id)sender {
    
    // 如果勾选了自动登录,记住密码也要勾选
    if (_autoLoginSwitch.on == YES) {
        [_rmbPwdSwitch setOn:YES animated:YES];
    
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 给文本框添加监听器,及时监听文本框内容的改变
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    
    // 判断下登录按钮能否点击
    [self textChange];
    
    //添加注册按钮
    [self addNavigationTiem];
//    [self.navigationItem setHidesBackButton:YES animated:NO];
//    
//    [self.navigationController setNavigationBarHidden:YES];
}
#pragma mark - 添加按钮
-(void)addNavigationTiem{
    //注销按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(zhuce)];
    
}
-(void)zhuce{
    X_RegsterViewController *X_regsterVC = [[X_RegsterViewController alloc] init];
    
    [self.navigationController pushViewController:X_regsterVC animated:YES];
}

// 任一一个文本框的内容改变都会调用
- (void)textChange
{
    _loginButton.enabled = _accountField.text.length && _pwdField.text.length;
//    NSLog(@"%@--%@",_accountField.text,_pwdField.text);
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
