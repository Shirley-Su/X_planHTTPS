//
//  X_ChatView.h
//  X_Jiyibi
//
//  Created by lanou3g on 16/6/14.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ButtonClick)(NSString *draftText);
@interface X_ChatView : UIView
@property(copy,nonatomic)ButtonClick buttonClicked;
@end
