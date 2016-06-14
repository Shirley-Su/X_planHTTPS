//
//  X_HYViewController.m
//  X_Jiyibi
//
//  Created by Saina on 16/6/13.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_HYViewController.h"
#import "X_HYTableViewCell.h"
#import "X_AddViewController.h"
#import "X_MessageViewController.h"
#import "X_ChatViewController.h"
#import <EaseMob.h>
@interface X_HYViewController ()
@property(nonatomic,strong)NSMutableArray *contArr;
@end

@implementation X_HYViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[EaseMob sharedInstance].chatManager asyncFetchBuddyListWithCompletion:^(NSArray *buddyList, EMError *error) {

        if (!error) {
            NSLog(@"获取成功 -- %@", buddyList);

            [self.contArr removeAllObjects];
            [self.contArr addObjectsFromArray:buddyList];
            [self.tableView reloadData];
        }
    } onQueue:dispatch_get_main_queue()];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"X_HYTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    //添加按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(rightAC)];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}
//添加按钮事件
-(void)rightAC{
    X_AddViewController *addVC = [[X_AddViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    X_HYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[X_HYTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }


    
    return cell;
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    X_ChatViewController *chatVC = [[X_ChatViewController alloc]init];
    EMBuddy *buddy = self.contArr[indexPath.row];
    chatVC.chatter = buddy.username;
    [self.navigationController pushViewController:chatVC animated:YES];


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
