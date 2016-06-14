//
//  AppDelegate.m
//  X_Jiyibi
//
//  Created by Saina on 16/6/13.
//  Copyright © 2016年 Saina. All rights reserved.
//

#import "AppDelegate.h"
#import "X_TabBarController.h"
#import "WelcomeView.h"
#import <EaseMob.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //创建根视图控制器
    UITabBarController *VC = [[X_TabBarController alloc] init];
    self.window.rootViewController = VC;
    
    //显示窗口
    [self.window makeKeyAndVisible];
    
    
    //显示欢迎界面
    WelcomeView *welconmV = [WelcomeView welcomeView];
    
    //注意: 一定要给界面设置尺寸
    welconmV.frame = self.window.bounds;
    
    
    //添加到视图上
<<<<<<< HEAD
//    [self.window addSubview:welconmV];
=======
    [self.window addSubview:welconmV];
    // Override point for customization after application launch.
    //registerSDKWithAppKey: 注册的AppKey，详细见下面注释。
    //apnsCertName: 推送证书名（不需要加后缀），详细见下面注释。
    [[EaseMob sharedInstance] registerSDKWithAppKey:@"coderqi#lessoneasymod" apnsCertName:@"istore_dev"];
    [[EaseMob sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
>>>>>>> e5f7119bd112fd5b74cc9009fe55dbcb4b41472a
    
//    [self showLoginView];

    
    return YES;
}
// 展示登录界面
- (void)showLoginView{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // 根据一个标记去获取控制器
    X_TabBarController *vc = [sb instantiateViewControllerWithIdentifier:@"loginVC"];
    [self.window makeKeyAndVisible];
    [self.window.rootViewController presentViewController:vc animated:YES completion:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[EaseMob sharedInstance] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
     [[EaseMob sharedInstance] applicationWillTerminate:application];
}

@end
