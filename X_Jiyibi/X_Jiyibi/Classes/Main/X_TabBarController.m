//
//  X_TabBarController.m
//  X_Jiyibi
//
//  Created by Saina on 16/6/13.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "X_TabBarController.h"
#import "X_GRTableViewController.h"
#import "X_HYViewController.h"
#import "X_JYBViewController.h"
#import "X_LSViewController.h"
#import "X_ZHTableViewController.h"

#import "SNTabBarItem.h"
#import "X_NamigationController.h"


@interface X_TabBarController ()<SNTabBarItemDelegate>
/*
 保存所有控制器对应按钮的内容, */
@property (strong, nonatomic) NSMutableArray *items;


@end

@implementation X_TabBarController
-(NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    [self setUpAllChildViewController];
    //自定义tabBar
    [self setUpTabBar];


}
#pragma mark - 自定义tabBar
-(void)setUpTabBar{
    //移除系统的tabBar, 相当于把tabBar上所有的按钮移除
    //把一个控件移除, 父控件并不会马上销毁, 一般情况, 在下一次运行循环的时候判断这个对象是否有强引用,如果没有,才会销毁;
    [self.tabBar removeFromSuperview];
    
    SNTabBarItem *tabBar = [[SNTabBarItem alloc] init];
    //创建对少个按钮(传值--)
    tabBar.items = self.items;
    //代理
    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.frame;
    tabBar.backgroundColor = [UIColor lightGrayColor];
    
    
    [self.view addSubview:tabBar];
}
#pragma mark - SNTabBarItemDelegate
//监听tabBar按钮上的点击
-(void)tabBar:(SNTabBarItem *)tabBar didClickBtn:(NSInteger)index{
    self.selectedIndex = index;
    
}

#pragma mark - 添加子控制器
//tabBar 上面的按钮的图片尺寸是有规定的, 不能超过44, 超过的话就会显示不出来;
-(void)setUpAllChildViewController{
   
    
    
    
    
    //记一笔
    X_JYBViewController *historyVC = [[X_JYBViewController alloc] init];
    [self setUpOneChildViewController:historyVC image:[UIImage imageNamed:@"TabBar_History_new"] seleImage:[UIImage imageNamed:@"TabBar_History_selected_new"]title:@"记一笔"];
    
    //流水
    X_LSViewController *myLotteryVC = [[X_LSViewController alloc] init];
    [self setUpOneChildViewController:myLotteryVC image:[UIImage imageNamed:@"TabBar_MyLottery_new"] seleImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]title:@"流水"];
    //账户
    X_ZHTableViewController *hallVC = [[X_ZHTableViewController alloc] init];
    [self setUpOneChildViewController:hallVC image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] seleImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"]title:@"账户"];
    //好友
    X_HYViewController *discoverVC = [[X_HYViewController alloc] init];
    [self setUpOneChildViewController:discoverVC image:[UIImage imageNamed:@"TabBar_Discovery_new"] seleImage:[UIImage  imageNamed:@"TabBar_Discovery_selected_new"]title:@"好友"];
    
    //个人
    X_GRTableViewController *areanVC = [[X_GRTableViewController alloc]init];
    [self setUpOneChildViewController:areanVC image:[UIImage imageNamed:@"TabBar_Arena_new"] seleImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]title:@"个人"];


}



#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image seleImage:(UIImage *)seleImage title:(NSString *)title{
    
    //设置标题
    vc.navigationItem.title = title;
    
    //描述按钮的内容
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = seleImage;
    
    //记录所有控制器对应按钮的内容
    [self.items addObject:vc.tabBarItem];
    
    //设置随机颜色
//        vc.view.backgroundColor = [self randomColor];
    
    //设置背景图片
//    UIImageView *imView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beijing1"]];
//    imView.frame = self.view.bounds;
//    [vc.view addSubview:imView];
    
    
    //添加导航条控制器
    X_NamigationController *nav = [[X_NamigationController alloc] initWithRootViewController:vc];
    /**不建议用这个方法,
     *  导航条的背景颜色是不能通过navigationItem设置, 设置导航条背景颜色必须在导航提爱哦显示之前设置, 不然不会显示设置的内容
     */
    //设置导航条背景图片, 必须填UIBarMetricsDefault: UIBarMetrics---其他的属性都是透明的, 如果设置的是这种模式, 默认的子控制器的View的显示尺寸会有变化的;
    //    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    [self addChildViewController:nav];
}
#pragma mark - 随机颜色
-(UIColor *)randomColor{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
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
