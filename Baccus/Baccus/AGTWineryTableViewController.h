//
//  AGTWineryTableViewController.h
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/7/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineryModel.h"

@interface AGTWineryTableViewController : UITableViewController

@property (strong, nonatomic) AGTWineryModel *model;

-(instancetype)initWithModel:(AGTWineryModel *)model style:(UITableViewStyle)style;

@end
