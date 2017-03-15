//
//  AGTViewController.m
//  Sandbox
//
//  Created by Roberto Manuel Halgravez Perea on 3/15/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTViewController.h"

@interface AGTViewController ()

@end

@implementation AGTViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)save:(id)sender {
    
    //Get cache url folder from Sandbox
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *url = [[fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
    
    //Append the file name to get the complete url fot the file test.txt
    url = [url URLByAppendingPathComponent:@"test.txt"];
    
    //Save something in the file
    NSError *error = nil;
    BOOL didWrite = NO;
    didWrite = [@"Hola Muñdo" writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (didWrite == NO) {
        NSLog(@"Erro when trying to write to the file: %@", error);
    }
    
    //Read file so we can see what it has
    NSString *resource = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    if (!resource) {
        NSLog(@"Erro when trying to read the file: %@", error);
    }
}

@end
