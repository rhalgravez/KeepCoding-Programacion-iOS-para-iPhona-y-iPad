//
//  AGTWineViewController.h
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/2/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineModel.h"

@interface AGTWineViewController : UIViewController

@property(strong, nonatomic) AGTWineModel *model;

-(instancetype) initWithModel:(AGTWineModel *) aModel;

@end
