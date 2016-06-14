//
//  X_TableViewCell.h
//  X_Jiyibi
//
//  Created by Saina on 16/6/13.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface X_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *noteImageView;//头像
//笔记本名称
@property (weak, nonatomic) IBOutlet UILabel *noteNameLabel;
//笔记本类型
@property (weak, nonatomic) IBOutlet UILabel *noteClassLabel;
//创建时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;



@end
