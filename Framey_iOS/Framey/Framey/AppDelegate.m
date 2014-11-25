//
//  AppDelegate.m
//  Framey3
//
//  Created by Varun Bhartia on 11/23/14.
//  Copyright (c) 2014 Varun Bhartia. All rights reserved.
//

#import "AppDelegate.h"

#import "FamilyViewController.h"
#import "FramesViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    NSBundle *appBundle = [NSBundle mainBundle];
    
    //Family View Controller Setup
    FamilyViewController *familyVC = [[FamilyViewController alloc] initWithNibName:@"FamilyView" bundle:appBundle];
    UINavigationController *familyNavController = [[UINavigationController alloc] initWithRootViewController:familyVC];
    familyNavController.tabBarItem.title = @"Family";
    
    
    //Frames View Controller Setup
    FramesViewController *framesVC = [[FramesViewController alloc] initWithNibName:@"FramesView" bundle:appBundle];
    UINavigationController *framesNavController = [[UINavigationController alloc] initWithRootViewController:framesVC];
    framesNavController.tabBarItem.title = @"Frames";
    
    //Notifications View Controller Setup
    UIViewController *notificationsVC = [[UIViewController alloc] initWithNibName:@"NotificationsView" bundle:appBundle];
    UINavigationController *notificationsNavController = [[UINavigationController alloc] initWithRootViewController:notificationsVC];
    notificationsNavController.tabBarItem.title = @"Notifications";
    
    //Setup Tabs
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[familyNavController, framesNavController, notificationsNavController];
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
