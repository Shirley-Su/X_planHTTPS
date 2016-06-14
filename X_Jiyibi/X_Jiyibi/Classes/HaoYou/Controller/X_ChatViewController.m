//
//  X_ChatViewController.m
//  X_Jiyibi
//
//  Created by lanou3g on 16/6/14.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_ChatViewController.h"
#import <EaseMob.h>
#import "X_ChatView.h"
#import "X_ChatTableViewCell.h"
@interface X_ChatViewController ()<UITableViewDataSource,UITableViewDelegate,EMChatManagerDelegate>
@property(strong,nonatomic)UITableView *chatTableview ;
@property(strong,nonatomic)EMConversation *conversation;
@property(strong,nonatomic)NSLayoutConstraint *layout;
@property(strong,nonatomic)X_ChatView *chatView;
@end

@implementation X_ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.chatter;

    [self.chatTableview setAllowsSelection:NO];

    self.chatView = [[X_ChatView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 40)];

    __weak typeof(self) weakSelf = self;

    self.chatView.buttonClicked = ^(NSString * draftText){
        
        [weakSelf sendMessageWithDraftText:draftText];

    };
    [self.view addSubview:self.chatView];

    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:dispatch_get_main_queue()];
    [self reloadChatRecords];


    //注册cell
    [self.chatTableview registerNib:[UINib nibWithNibName:@"X_ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //移除通知中心
    [self removeForKeyboardNotifications];
    //移除代理
    [[EaseMob sharedInstance].chatManager removeDelegate:self];
}
//发送消息
- (void)sendMessageWithDraftText:(NSString *)draftText {

    EMChatText * chatText = [[EMChatText alloc] initWithText:draftText];
    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithChatObject:chatText];

    // 生成message
    EMMessage * message = [[EMMessage alloc] initWithReceiver:self.chatter bodies:@[body]];
    message.messageType = eMessageTypeChat; // 设置为单聊消息

    [[EaseMob sharedInstance].chatManager asyncSendMessage:message progress:nil prepare:^(EMMessage *message, EMError *error) {

        // 准备发送
    } onQueue:dispatch_get_main_queue() completion:^(EMMessage *message, EMError *error) {

        [self reloadChatRecords];
        // 发送完成
    } onQueue:dispatch_get_main_queue()];
}
//收到消息
- (void)didReceiveMessage:(EMMessage *)message {

    [self reloadChatRecords];
}


/**
 *  重新加载TableView上面显示的聊天信息, 并移动到最后一行
 */
- (void)reloadChatRecords {

    self.conversation = [[EaseMob sharedInstance].chatManager conversationForChatter:self.chatter conversationType:eConversationTypeChat];

    [self.chatTableview reloadData];

    if ([self.conversation loadAllMessages].count > 0) {

        [self.chatTableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.conversation loadAllMessages].count - 1 inSection:0] atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
    }
}


/**
 *  注册通知中心
 */
- (void)registerForKeyboardNotifications
{
    // 使用NSNotificationCenter 注册观察当键盘要出现时
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    // 使用NSNotificationCenter 注册观察当键盘要隐藏时
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

/**
 *  移除通知中心
 */
- (void)removeForKeyboardNotifications {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//弹出键盘
- (void)didKeyboardWillShow:(NSNotification *)notification {

    NSDictionary * info = [notification userInfo];

    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;

    NSLog(@"%f", keyboardSize.height);

    //输入框位置动画加载
    [self begainMoveUpAnimation:keyboardSize.height];
}

//隐藏键盘
- (void)didKeyboardWillHide:(NSNotification *)notification {

    [self begainMoveUpAnimation:0];
}

/**
 *  开始执行键盘改变后对应视图的变化
 *
 *  @param height 键盘的高度
 */
- (void)begainMoveUpAnimation:(CGFloat)height {

    [UIView animateWithDuration:0.3 animations:^{

        [self.chatView setFrame:CGRectMake(0, self.view.frame.size.height - (height + 40), self.chatView.frame.size.width, self.chatView.frame.size.height)];
    }];

    [self.layout setConstant:height + 40];

    [self.chatTableview layoutIfNeeded];

    if ([self.conversation loadAllMessages].count > 1) {

        [self.chatTableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.conversation.loadAllMessages.count - 1 inSection:0] atScrollPosition:(UITableViewScrollPositionMiddle) animated:YES];
    }
}

# pragma mark - Table View Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.conversation.loadAllMessages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    X_ChatTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    EMMessage * message = self.conversation.loadAllMessages[indexPath.row];

    EMTextMessageBody * body = [message.messageBodies lastObject];

    if ([message.to isEqualToString:self.chatter]) {

        cell.textLabel.text = body.text;
        cell.detailTextLabel.text = @"";

    } else {

        cell.textLabel.text = @"";
        cell.detailTextLabel.text = body.text;
    }

    return cell;
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
