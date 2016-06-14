//
//  X_MessageViewController.m
//  X_Jiyibi
//
//  Created by lanou3g on 16/6/14.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_MessageViewController.h"
#import <EaseMob.h>
#import "X_MessageTableViewCell.h"
#import "X_ChatViewController.h"
@interface X_MessageViewController ()<UITableViewDelegate,UITableViewDataSource,EMChatManagerDelegate>


@property(strong,nonatomic)UITableView *messageTable;
@property(strong,nonatomic)NSMutableArray *dataArr;
@end

@implementation X_MessageViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[EaseMob sharedInstance].chatManager removeDelegate:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];

    [self reloadData];

    [self.messageTable registerNib:[UINib nibWithNibName:@"X_MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];

}
//刷新数据
-(void)reloadData{
    [self.dataArr removeAllObjects];
    [self.dataArr addObjectsFromArray:[[EaseMob sharedInstance].chatManager loadAllConversationsFromDatabaseWithAppend2Chat:YES]];
}
//收到消息回调
-(void)didReceiveMessage:(EMMessage *)message{
    [self reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    X_MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    EMConversation *conversation = self.dataArr[indexPath.row];

    cell.textLabel.text = conversation.chatter;

    EMMessage *message = [conversation latestMessage];

    EMTextMessageBody *body = [message.messageBodies lastObject];

    cell.detailTextLabel.text = body.text;

    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    X_ChatViewController *chatVC = [[X_ChatViewController alloc]init];
    EMConversation *conversation = self.dataArr[indexPath.row];
    chatVC.chatter = conversation.chatter;
    [self.navigationController pushViewController:chatVC animated:YES];
}
//收到来自好友的请求
-(void)didReceiveBuddyRequest:(NSString *)username message:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"收到来自%@的请求",username] message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *acceptACtion = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        EMError *error;
        //同意好友的请求
        if ([[EaseMob sharedInstance].chatManager acceptBuddyRequest:username error:&error] &&!error) {
            NSLog(@"发送同意成功");
        }
    }];

    UIAlertAction *rejectAC = [UIAlertAction actionWithTitle:@"圆润的走开" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        EMError *error;
        //拒绝好友的方法
        if ([[EaseMob sharedInstance].chatManager rejectBuddyRequest:username reason:@"走开,圆润的走开" error:&error] && !error) {
            NSLog(@"发送拒绝成功");
        }
    }];
    [alertController addAction:acceptACtion];
    [alertController addAction:rejectAC];
    [self showDetailViewController:alertController sender:nil];
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
