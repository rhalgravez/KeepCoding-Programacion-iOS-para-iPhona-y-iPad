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
    AGTWineModel *wine = [self wineForIndexPath:indexPath];
    
    //Set the cell's content
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    //Return the cell
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Find out which wine is selected
    AGTWineModel *wine = [self wineForIndexPath:indexPath];
    
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        //If we are in iPhone we do a push
        [self.delegate wineryTableViewController:self didSelectWine:wine];
    } else {
        //If we are in an iPad
        [self.delegate wineryTableViewController:self didSelectWine:wine];
        
        //Create Notification
        NSNotification *notification = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME object:self userInfo:@{WINE_KEY: wine}];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        
        //Save the last wine selected
        [self saveLastSelectedWineAtSection:indexPath.section row:indexPath.row];
    }
}

#pragma mark - AGTWineryTableViewControllerDelegate
-(void)wineryTableViewController:(AGTWineryTableViewController *)wineryVC didSelectWine:(AGTWineModel *)wine {
    AGTWineViewController *wineVC = [[AGTWineViewController alloc] initWithModel:wine];
    [self.navigationController pushViewController:wineVC animated:YES];
}

#pragma mark - NSUserDEfaults

-(void) saveLastSelectedWineAtSection:(NSUInteger)section row:(NSUInteger)row {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{SECTION_KEY: @(section), ROW_KEY: @(row)}
                 forKey:LAST_WINE_KEY];
    [defaults synchronize];
}

-(AGTWineModel *)lasSelectedWine {
    NSDictionary *coordinates = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_WINE_KEY];
    
    //We need to check if there is nothing saved on LAS_WINE_KEY
    if (!coordinates) {
        //Maybe is the first time the user opens the app
        //We need to set a default value, maybe the first red wine
        coordinates = [self setDefaults];
        
    }
    //Set the coordinates into an indexPath
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[coordinates[ROW_KEY] integerValue]
                                                inSection:[coordinates[SECTION_KEY] integerValue]];
    
    
    return [self wineForIndexPath:indexPath];
}

-(NSDictionary *)setDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //By default we show the first red wine
    NSDictionary *defaultWineCoordinates = @{SECTION_KEY: @(RED_WINE_SECTION), ROW_KEY: @0};
    
    //set the default value to de NSUserEfaults
    [defaults setObject:defaultWineCoordinates forKey:LAST_WINE_KEY];
    [defaults synchronize];
    
    return defaultWineCoordinates;
}

#pragma mark -  Utils
-(AGTWineModel *)wineForIndexPath:(NSIndexPath *)indexPath {
    AGTWineModel *wine;
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:(int)indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.model whiteWineAtIndex:(int)indexPath.row];
    } else {
        wine = [self.model otherWineAtIndex:(int)indexPath.row];
    }
    
    return wine;
}
@end
