//
//  AGTWineryTableViewController.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/7/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTWineryTableViewController.h"
#import "AGTWineViewController.h"

//Private Constants
static int const RED_WINE_SECTION = 0;
static int const WHITE_WINE_SECTION = 1;
//static int const OTHER_WINE_SECTION = 2;

static NSString * const SECTION_KEY = @"section";
static NSString * const ROW_KEY = @"row";
static NSString * const LAST_WINE_KEY = @"lastWine";

//Public Constants
NSString * const NEW_WINE_NOTIFICATION_NAME = @"newWine";
NSString * const WINE_KEY = @"wine";


@interface AGTWineryTableViewController ()

@end

@implementation AGTWineryTableViewController

#pragma mark - Init

-(instancetype)initWithModel:(AGTWineryModel *)model style:(UITableViewStyle)style {
    if (self = [super initWithStyle:style]) {
        _model = model;
        self.title = @"Baccus";
    }
    
    return self;
}

#pragma mark -Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.13 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == RED_WINE_SECTION) {
        return self.model.redWineCount;
    } else if (section == WHITE_WINE_SECTION) {
        return self.model.whiteWineCount;
    } else {
        return self.model.otherWineCount;
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == RED_WINE_SECTION) {
        return @"Red wines";
    } else if (section == WHITE_WINE_SECTION) {
        return @"White wines";
    } else {
        return @"Other Wines";
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        //Creating the cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //Find out which model is for the cell
    AGTWineModel *wine;
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:(int)indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.model whiteWineAtIndex:(int)indexPath.row];
    } else {
        wine = [self.model otherWineAtIndex:(int)indexPath.row];
    }
    
    //Set the cell's content
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    //Return the cell
    return cell;
}

#pragma mark - Tavle view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Find out which wine is selected
    AGTWineModel *wine = nil;
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:(int)indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.model whiteWineAtIndex:(int)indexPath.row];
    } else {
        wine = [self.model otherWineAtIndex:(int)indexPath.row];
    }
    
    [self.delegate wineryTableViewController:self didSelectWine:wine];
    
    //Create Notification
    NSNotification *notification = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME object:self userInfo:@{WINE_KEY: wine}];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    //Save the last wine selected
    [self saveLastSelectedWineAtSection:indexPath.section row:indexPath.row];
}

#pragma mark - NSUserDEfaults

-(void) saveLastSelectedWineAtSection:(NSUInteger)section row:(NSUInteger)row {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{SECTION_KEY: @(section), ROW_KEY: @(row)}
                 forKey:LAST_WINE_KEY];
    [defaults synchronize];
}

@end
