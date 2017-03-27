//
//  AGTFontViewController.m
//  Fuentes
//
//  Created by Roberto Manuel Halgravez Perea on 3/27/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTFontViewController.h"

@interface AGTFontViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fontNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *fontTextView;
@property (strong, nonatomic) UIFont *font;

@end

@implementation AGTFontViewController

-(instancetype) initWithFont:(UIFont *)font {
    if ([super initWithNibName:nil bundle:nil]) {
        _font = font;
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
