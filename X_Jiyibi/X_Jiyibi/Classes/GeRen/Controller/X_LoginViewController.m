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

@interface X_LoginViewController ()
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

@implementation X_LoginViewController

// 在执行跳转之前的时候调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    UIViewController *vc = segue.destinationViewController;
    vc.title = [NSString stringWithFormat:@"%@的联系人列表", _accountField.text];
    NSLog(@"%@--%@",segue.sourceViewController,segue.destinationViewController);
}

// 点击了登录按钮的时候调用
// xmg 123
- (IBAction)login:(id)sender {
    
    // 提示用户，正在登录ing...
    [MBProgressHUD showMessage:@"正在登录ing..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 隐藏蒙版
        [MBProgressHUD hideHUD];
        
        // 验证下账号和密码是否正确
        if ([_accountField.text isEqualToString:@"X_APP"] && [_pwdField.text isEqualToString:@"123"]) { // 输入正确
            
            // 直接跳转
            // 跳转到联系人界面
            X_GRTableViewController *x_GRVC = [[X_GRTableViewController alloc] init];
            
            [self.navigationController pushViewController:x_GRVC animated:YES];
            
        }else{ // 账号或者密码错误
            
            // 提示用户账号或者密码错误
            [MBProgressHUD showError:@"账号或者密码错误"];
        }
    });
   
    
    
}

// 记住密码开关状态改变的时候调用
- (IBAction)rmbPwdChange:(id)sender {
    // 如果取消记住密码，自动登录也需要取消勾选
    
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
    
}
#pragma mark - 添加按钮
-(void)addNavigationTiem{
    //登录 / 注销按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(zhuce)];
    
}
-(void)zhuce{
    
}

// 任一一个文本框的内容改变都会调用
- (void)textChange
{
    _loginButton.enabled = _accountField.text.length && _pwdField.text.length;
    NSLog(@"%@--%@",_accountField.text,_pwdField.text);
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
