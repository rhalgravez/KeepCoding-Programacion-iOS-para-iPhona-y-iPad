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

@interface AGTAppDelegate ()

@end

@implementation AGTAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Create a model
    AGTWineModel *tintorro = [AGTWineModel wineWithName:@"Bembibre"
                                       wineCompanyName:@"Dominio de Tareas"
                                                  type:@"tinto"
                                                origin:@"El Bierzo"
                                                grapes:@[@"Mencía"]
                                        wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com/index.php/es/vinos/baltos/74-bembibrevinos"]
                                                 notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                               raiting:5
                                                 photo:[UIImage imageNamed:@"bembibre"]];
    
    //Create the controller
    AGTWineViewController *wineVC = [[AGTWineViewController alloc] initWithModel:tintorro];
    AGTWebViewController *webVC = [[AGTWebViewController alloc] initWithModel:tintorro];
    
    //Create a UITabBarController
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[wineVC, webVC];
    
    //Set the root view controller
    self.window.rootViewController = tabVC;
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


@end
