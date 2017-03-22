//
//  AGTWineryTableViewController.h
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/7/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineryModel.h"
#import "AGTWineryTableViewControllerDelegate.h"

extern NSString * const NEW_WINE_NOTIFICATION_NAME;
extern NSString * const WINE_KEY;

@interface AGTWineryTableViewController : UITableViewController <AGTWineryTableViewControllerDelegate>

@property (strong, nonatomic) AGTWineryModel *model;
@property (weak, nonatomic) id<AGTWineryTableViewControllerDelegate> delegate;

-(instancetype)initWithModel:(AGTWineryModel *)model style:(UITableViewStyle)style;

-(AGTWineModel *)lasSelectedWine;

@end
