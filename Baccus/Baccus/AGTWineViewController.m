//
//  AGTWineViewController.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/2/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTWineViewController.h"

@interface AGTWineViewController ()

@end

@implementation AGTWineViewController

#pragma mark - Init

-(instancetype) initWithModel:(AGTWineModel *) aModel {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
        
        self.title = aModel.name;
    }
    
    return self;
    
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"viewDidload");
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    
    [self syncModelWithView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)displayWeb:(id)sender {
    NSLog(@"Go to %@", self.model.wineCompanyWeb);
}

#pragma mark - Utils

-(void)syncModelWithView {
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

@end
