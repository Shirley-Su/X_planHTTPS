//
//  X_GRTableViewController.m
//  X_Jiyibi
//
//  Created by Saina on 16/6/13.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_GRTableViewController.h"
#import "X_TableViewCell.h"
#import "X_LoginViewController.h"
@interface X_GRTableViewController ()<UIActionSheetDelegate>

@end

@implementation X_GRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏cell的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:@"X_TableViewCell" bundle:nil] forCellReuseIdentifier:@"GRcell"];
    
   #pragma mark - 添加按钮
    [self addNavigationTiem];
    
    
    
}
#pragma mark - 添加按钮
-(void)addNavigationTiem{
    //登录 / 注销按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(zhixiao)];

}

-(void)zhixiao{
    // 弹出actionSheet
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否注销?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];

    [sheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
// 点击UIActionSheet控件上的按钮调用
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) { // 点击了注销
        
        
        
        X_LoginViewController *x_loginVC = [[X_LoginViewController alloc] init];
        
        
        [self.navigationController pushViewController:x_loginVC animated:YES];
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    X_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GRcell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[X_TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GRcell"];
    }
    
    // Configure the cell...
    
    
    return cell;
}


#pragma mark - 点击cell跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
