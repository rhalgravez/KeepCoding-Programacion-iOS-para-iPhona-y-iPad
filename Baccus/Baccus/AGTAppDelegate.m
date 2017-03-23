//
//  AppDelegate.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/1/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTAppDelegate.h"
#import "AGTWineModel.h"
#import "AGTWineViewController.h"
#import "AGTWebViewController.h"
#import "AGTWineryModel.h"
#import "AGTWineryTableViewController.h"

@interface AGTAppDelegate ()

@end

@implementation AGTAppDelegate

#pragma mark - App State Changes and System Events

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Create the model
    AGTWineryModel *winery = [[AGTWineryModel alloc] init];
    
    //Configure controllers, delegates deppending the device
    UIViewController *rootVC;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
        rootVC = [self rootViewControllerForPadWithModel:winery];
    } else {
        rootVC = [self rootViewControllerForPhoneWithModel:winery];
    }
    
    //Set the root view controller
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
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

#pragma mark - Utils

-(UIViewController *)rootViewControllerForPadWithModel:(AGTWineryModel *)model {
    //Create the controllers
    AGTWineryTableViewController *tableVC = [[AGTWineryTableViewController alloc] initWithModel:model style:UITableViewStylePlain];
    AGTWineViewController *wineVC = [[AGTWineViewController alloc] initWithModel:[tableVC lasSelectedWine]];
    
    //Create the UINavigationControllers
    UINavigationController *wineryNavVC = [[UINavigationController alloc] initWithRootViewController:tableVC];
    UINavigationController *wineNav = [[UINavigationController alloc] initWithRootViewController:wineVC];
    
    //Create the SplitView
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[wineryNavVC, wineNav];
    
    //Set Delegates
    splitVC.delegate = wineVC;
    tableVC.delegate = wineVC;
    
    return splitVC;
}

-(UIViewController *)rootViewControllerForPhoneWithModel:(AGTWineryModel *)model {
    //Create the controller
    AGTWineryTableViewController *tableVC = [[AGTWineryTableViewController alloc] initWithModel:model style:UITableViewStylePlain];
    
    //Create navigation Controller
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tableVC];
    
    return navController;
}

@end
