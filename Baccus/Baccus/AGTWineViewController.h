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

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;

@property(strong, nonatomic) AGTWineModel *model;

-(instancetype) initWithModel:(AGTWineModel *) aModel;

-(IBAction)displayWeb:(id)sender;

@end
