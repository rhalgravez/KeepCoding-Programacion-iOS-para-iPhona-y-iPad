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
    
    AGTWineModel *albarinno = [AGTWineModel wineWithName:@"Zárate"
                                         wineCompanyName:@"Zárate"
                                                    type:@"white"
                                                  origin:@"Rias Bajas"
                                                  grapes:@[@"Albariño"]
                                          wineCompanyWeb:[NSURL URLWithString:@"http://www.albarino-zarate.com"]
                                                   notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                  raiting:4
                                                   photo:[UIImage imageNamed:@"zarate"]];
    
    AGTWineModel *champagne = [AGTWineModel wineWithName:@"Comtes de Champagne"
                                         wineCompanyName:@"Champagne Taittinger"
                                                    type:@"other"
                                                  origin:@"Champagne"
                                                  grapes:@[@"Chardonnay"]
                                          wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                   notes:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc purus. Curabitur eu velit mauris. Curabitur magna nisi, ullamcorper ac bibendum ac, laoreet et justo. Praesent vitae tortor quis diam luctus condimentum. Suspendisse potenti. In magna elit, interdum sit amet facilisis dictum, bibendum nec libero. Maecenas pellentesque posuere vehicula. Vivamus eget nisl urna, quis egestas sem. Vivamus at venenatis quam. Sed eu nulla a orci fringilla pulvinar ut eu diam. Morbi nibh nibh, bibendum at laoreet egestas, scelerisque et nisi. Donec ligula quam, semper nec bibendum in, semper eget dolor. In hac habitasse platea dictumst. Maecenas adipiscing semper rutrum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
                                                  raiting:5
                                                   photo:[UIImage imageNamed:@"comtesDeChampagne"]];
    
    //Create the controllers
    AGTWineViewController *tintoVC = [[AGTWineViewController alloc] initWithModel:tintorro];
    AGTWineViewController *blancoVC = [[AGTWineViewController alloc] initWithModel:albarinno];
    AGTWineViewController *otroVC = [[AGTWineViewController alloc] initWithModel:champagne];

    
    //Create the UINavigationControllers
    UINavigationController *tintoNav = [[UINavigationController alloc] initWithRootViewController:tintoVC];
    UINavigationController *blancoNav = [[UINavigationController alloc] initWithRootViewController:blancoVC];
    UINavigationController *otroNav = [[UINavigationController alloc] initWithRootViewController:otroVC];
    
    //Create the UITabBarController
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[tintoNav, blancoNav, otroNav];
    
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
