//
//  AGTWebViewController.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/6/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTWebViewController.h"
#import "AGTWineryTableViewController.h"

@interface AGTWebViewController ()

@end

@implementation AGTWebViewController

#pragma mark - Init

-(instancetype) initWithModel: (AGTWineModel *)model {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
        
        self.title = @"Web";
    }
    
    return self;
}

#pragma mark - Lifecycle

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //Add notificcation Observer
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(wineDidChange:) name:NEW_WINE_NOTIFICATION_NAME object:nil];
    
    [self displayURL: self.model.wineCompanyWeb];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //Remove notification Observer
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

#pragma mark - Utils

-(void)displayURL: (NSURL *)url {
    self.browser.delegate = self;
    
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    
    [self.browser loadRequest:[NSURLRequest requestWithURL:url]];
    
    
}

-(void)wineDidChange:(NSNotification *)notification {
    NSDictionary *dict= notification.userInfo;
    AGTWineModel *newWine = [dict objectForKey:WINE_KEY];
    
    //Update the model
    self.model = newWine;
    [self displayURL:self.model.wineCompanyWeb];
}

#pragma mark - UIWebViewDelegate
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityView stopAnimating];
    self.activityView.hidden = YES;
}

@end
