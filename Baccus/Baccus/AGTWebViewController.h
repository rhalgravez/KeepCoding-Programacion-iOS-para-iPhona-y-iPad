//
//  AGTWebViewController.h
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/6/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineModel.h"

@interface AGTWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) AGTWineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(instancetype) initWithModel: (AGTWineModel *)model;

@end
