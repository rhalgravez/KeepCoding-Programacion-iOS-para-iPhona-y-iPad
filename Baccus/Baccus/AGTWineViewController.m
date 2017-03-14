//
//  AGTWineViewController.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/2/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTWineViewController.h"
#import "AGTWebViewController.h"


@interface AGTWineViewController ()

@end

@implementation AGTWineViewController

#pragma mark - Init

-(instancetype) initWithModel:(AGTWineModel *) aModel {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
        
        
    }
    
    return self;
    
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"viewDidload");
    
    if (self.splitViewController.displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        self.navigationItem.rightBarButtonItem = self.splitViewController.displayModeButtonItem;
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    
    //Prevent the nav bar to averlap the view
    self.edgesForExtendedLayout =UIRectEdgeNone;
    
    [self syncModelWithView];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.13 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)displayWeb:(id)sender {
    //Create web view controller
    AGTWebViewController *webVC = [[AGTWebViewController alloc] initWithModel:self.model];
    //Push to the webVC
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark - Utils

-(void)syncModelWithView {
    self.title = self.model.name;
    
    self.nameLabel.text = self.model.name;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.notesLabel.text = self.model.notes;
    self.wineryNameLabel.text = self.model.wineCompanyName;
    self.photoView.image = self.model.photo;
    self.grapesLabel.text = [self arrayToString: self.model.grapes];
    
    [self displayRating:self.model.rating];
}

-(NSString *)arrayToString: (NSArray *) array {
    NSString *str = @"";
    if (array.count == 1) {
        str = [@"100% " stringByAppendingString:[array firstObject]];
    } else {
        str = [array componentsJoinedByString:@", "];
    }
    
    return str;
}

-(void)displayRating:(int) rating {
    [self clearRating];
    
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    for (int i = 0; i < rating; i++) {
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
}

-(void) clearRating {
    for (UIImageView *imageView in self.ratingViews) {
        imageView.image = nil;
    }
}

#pragma mark - UISplitViewControllerDelegate

-(void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode {
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;
    } else if (displayMode == UISplitViewControllerDisplayModeAllVisible) {
        self.navigationItem.rightBarButtonItem = nil;
    }
    
}

#pragma mark - AGTWineryTableViewControllerDelegate
-(void)wineryTableViewController:(AGTWineryTableViewController *)wineryVC didSelectWine:(AGTWineModel *)wine {
    self.model = wine;
    [self syncModelWithView];
}

@end
