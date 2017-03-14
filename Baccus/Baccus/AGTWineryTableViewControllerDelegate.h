//
//  AGTWineryTableViewControlling.h
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/14/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//
@class AGTWineryTableViewController;
@class AGTWineModel;

@protocol AGTWineryTableViewControllerDelegate <NSObject>

-(void)wineryTableViewController:(AGTWineryTableViewController *)wineryVC didSelectWine:(AGTWineModel *)wine;

@end
