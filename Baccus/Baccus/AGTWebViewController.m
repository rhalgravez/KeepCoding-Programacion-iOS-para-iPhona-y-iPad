//
//  AGTWebViewController.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/6/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTWebViewController.h"

@interface AGTWebViewController ()

@end

@implementation AGTWebViewController

#pragma mark - Init

-(instancetype) initWithModel: (AGTWineModel *)model {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
