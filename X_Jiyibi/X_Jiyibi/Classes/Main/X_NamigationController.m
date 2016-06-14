//
//  X_NamigationController.m
//  X_Jiyibi
//
//  Created by Saina on 16/6/13.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_NamigationController.h"

@interface X_NamigationController ()

@end

@implementation X_NamigationController
/**
 *  当前类或者他的子类, 初始化的时候才会调用
 */
+(void)initialize{
    ///获取当前应用的所有的导航条:appearance获取所有导行条的标志, 会更改系统的导航条, 容易出现bug, 不建议使用,
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"屏幕快照 2016-06-14 上午8.44.30"] forBarMetrics:UIBarMetricsDefault];
    
    
    //设置导航条标题的颜色
    NSMutableDictionary *titleDic = [NSMutableDictionary dictionary];
    titleDic[NSForegroundColorAttributeName] = [UIColor whiteColor];//设置颜色
    titleDic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];//设置字体大小
    //添加
    [bar setTitleTextAttributes:titleDic];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
