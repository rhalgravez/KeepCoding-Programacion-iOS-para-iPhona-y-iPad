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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)displayWeb:(id)sender {
    NSLog(@"Go to %@", self.model.wineCompanyWeb);
}

@end
