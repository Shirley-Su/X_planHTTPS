//
//  X_ZHTableViewController.m
//  X_Jiyibi
//
//  Created by Saina on 16/6/13.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_ZHTableViewController.h"

#import "X_HeaderView.h"

#define KWIDTH  [UIScreen mainScreen].bounds.size.width
#define KHEIGHT  [UIScreen mainScreen].bounds.size.height

@interface X_ZHTableViewController ()

//  tableView 的数据源
@property (nonatomic,strong)NSArray *listArr;


@end

@implementation X_ZHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 取消cell分割线
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    // 初始化数据源
    // 现金
    NSInteger bankCard = 0;
    NSString *str1 = [NSString stringWithFormat:@"现金: %ld",bankCard ];
    
    // 支付宝
    NSInteger monthPay = 0;
    NSString *str2 = [NSString stringWithFormat:@"支付宝: %ld",monthPay];
    
    // 银行卡
    NSInteger budgetAmount = 0;
    NSString *str3 = [NSString stringWithFormat:@"银行卡:%ld",budgetAmount];
    
    // 股票账户
    NSInteger stockAccount = 0;
    NSString *str4 = [NSString stringWithFormat:@"股票账户: %ld",stockAccount];
    
    
    _listArr = @[str1,str2,str3,str4,@"余额"];
    
    // 初始化控件
    self.accountListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT - 64)style:(UITableViewStylePlain)];
    
    // 设置代理
    self.accountListTableView.delegate = self;
    self.accountListTableView.dataSource = self;
    
    // 清除多余分割线
    self.accountListTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    // 设置头视图
    self.headerView = [[X_HeaderView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 120)];
    self.headerView.backgroundColor = [UIColor colorWithRed:255/255.0 green:201/255.0 blue:91/255.0 alpha:1];
    self.accountListTableView.tableHeaderView = self.headerView;
    
    
    // 255  201 91
    // 注册cell
    [self.accountListTableView registerClass:[UITableViewCell  class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:(UIBarButtonItemStyleDone) target:self action:@selector(edingAC)];

    
    // 添加视图
    [self.view addSubview:self.accountListTableView];
    
}

// 编辑按钮点击事件
- (void)edingAC{
    
}


//==========================================


#pragma mark - TableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==  nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _listArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 加一个分支结构,来判断各个cell 的点击情况
    switch (indexPath.row) {
        case 0:
        { // 现金
            
        }
            break;
            
        case 1:
        { //支付宝
            
        }
            break;
        case 2:
        {// 银行卡
            
        }
            break;
        case 3:
        {// 股票账户
            
        }
            break;
            
        default:
            break;
            
    }
}
//==========================================
//先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 左划删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   editingStyle = UITableViewCellEditingStyleDelete;//此处的EditingStyle可等于任意UITableViewCellEditingStyle，该行代码只在iOS8.0以前版本有作用，也可以不实现。
//    [tableView setEditing:NO animated:YES];
}

// 定义左划删除的颜色/风格
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleDestructive) title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"点击删除");
    }];//此处是iOS8.0以后苹果最新推出的api，UITableViewRowAction，Style是划出的标签颜色等状态的定义，这里也可自行定义
    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleNormal) title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    editRowAction.backgroundColor = [UIColor colorWithRed:215/255.0 green:217/255.0 blue:215/255.0 alpha:1];
    return @[deleteRowAction,editRowAction];
    
}


////先设置Cell可移动
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
////当两个Cell对换位置后
//- (void)tableView:(UITableView*)tableView moveRowAtIndexPath:(NSIndexPath*)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
//{
//    
//}
//
////设置进入编辑状态时，Cell不会缩进
//- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return NO;
//}

//- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
////    cell.showsReorderControl =YES;
//    return YES;
//
//}

@end
