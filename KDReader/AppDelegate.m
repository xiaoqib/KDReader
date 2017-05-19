//
//  AppDelegate.m
//  KDReader
//
//  Created by 陳升琪 on 2017/5/15.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import "AppDelegate.h"
#import "CategoryViewController.h"
#import "BookcaseViewController.h"
#import "SearchViewController.h"
#import "SelectionViewController.h"
#import "BaseViewController.h"
#import "BaseNavigationViewController.h"
#import "SettingsViewController.h"

@interface AppDelegate ()

@property (nonatomic,strong) CategoryViewController * categoryVC; //分类
@property (nonatomic,strong) BookcaseViewController * bookcaseVC; //书架
@property (nonatomic,strong) SearchViewController * searchVC;  //搜书
@property (nonatomic,strong) SelectionViewController *selectionVC; //精选
@property (nonatomic,strong) SettingsViewController *settingVC;//设置

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tb = [[UITabBarController alloc]init];
    
    self.window.rootViewController = tb;
    
    self.categoryVC = [[CategoryViewController alloc]init];
    
    self.bookcaseVC = [[BookcaseViewController alloc]init];
    
    self.settingVC = [[SettingsViewController alloc]init];
    
    self.selectionVC = [[SelectionViewController alloc]init];


    BaseNavigationViewController * nav1 = [[BaseNavigationViewController alloc]initWithRootViewController:self.bookcaseVC];
    
    BaseNavigationViewController * nav2 = [[BaseNavigationViewController alloc]initWithRootViewController:self.selectionVC];
    
    BaseNavigationViewController * nav3 = [[BaseNavigationViewController alloc]initWithRootViewController:self.categoryVC];
    
    BaseNavigationViewController * nav4 = [[BaseNavigationViewController alloc]initWithRootViewController:self.settingVC];
    
    nav1.tabBarItem.title = @"书架";
    nav2.tabBarItem.title = @"精选";
    nav3.tabBarItem.title = @"分类";
    nav4.tabBarItem.title = @"设置";



    tb.viewControllers = @[nav1,nav2,nav3,nav4];
    
//    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
