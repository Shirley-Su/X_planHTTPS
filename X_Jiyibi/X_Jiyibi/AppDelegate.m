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
#import "X_LoginViewController.h"
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
    [self.window addSubview:welconmV];
    
    // 注册环信SDK
    [[EaseMob sharedInstance] registerSDKWithAppKey:@"coderqi#lessoneasymod" apnsCertName:@""];
    
    // 用户验证失败
    [self userAuthenticationFailed];

    
    return YES;
}
- (void)userAuthenticationFailed {
    
//    X_LoginViewController * loginVC = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([X_LoginViewController class])];
//    
//    UINavigationController * navigationController = (UINavigationController *)self.window.rootViewController;
//    
//    [navigationController pushViewController:loginVC animated:NO];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
       [[EaseMob sharedInstance] applicationDidEnterBackground:application];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EaseMob sharedInstance] applicationWillEnterForeground:application];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
    [[EaseMob sharedInstance] applicationWillTerminate:application];
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
