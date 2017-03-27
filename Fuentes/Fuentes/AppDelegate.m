//
//  AppDelegate.m
//  Fuentes
//
//  Created by Roberto Manuel Halgravez Perea on 3/23/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTAppDelegate.h"
#import "AGTFontsTableViewCOntroller.h"

@interface AGTAppDelegate ()

@end

@implementation AGTAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Configure appeareance
    [self customizeAppearance];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    AGTFontsTableViewController *tableVC = [[AGTFontsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:tableVC];
    
    self.window.rootViewController = navVC;
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
-(void)customizeAppearance {
    UIColor *darkBlue = [UIColor colorWithRed:10.0/255.0 green:17.0/255.0 blue:31.0/255.0 alpha:1];
    UIColor *darkRed = [UIColor colorWithRed:168.0/255.0 green:11.0/255.0 blue:31.0/255.0 alpha:0.5];
    UIColor *clearGrey = [UIColor colorWithRed:227.0/255.0 green:227.0/255.0 blue:227.0/255.0 alpha:1];
    
    [[UITableViewHeaderFooterView appearance] setTintColor:darkRed];//Cgange heaer background color
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UITableViewHeaderFooterView class]]] setTextColor:[UIColor greenColor]];//Change uilabel in header color
    [[UINavigationBar appearance] setBarTintColor:darkBlue];//Change navBar background color
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: clearGrey}];//Change text color in navbar
}


@end
