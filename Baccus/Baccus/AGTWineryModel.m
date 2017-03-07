//
//  AGTWineryModel.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/7/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTWineryModel.h"

@interface AGTWineryModel ()

@property (strong, nonatomic) NSArray *redWines;
@property (strong, nonatomic) NSArray *whiteWines;
@property (strong, nonatomic) NSArray *otherWines;

@end

@implementation AGTWineryModel

#pragma mark - Querying the arrays

-(AGTWineModel *)redWineAtIndex:(int)index {
    return [self.redWines objectAtIndex:index];
}

-(AGTWineModel *)whiteWineAtIndex:(int)index {
    return [self.whiteWines objectAtIndex:index];
}
-(AGTWineModel *)otherWineAtIndex:(int)index {
    return [self.otherWines objectAtIndex:index];
}

@end
