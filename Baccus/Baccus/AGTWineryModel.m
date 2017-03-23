//
//  AGTWineryModel.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/7/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTWineryModel.h"

static NSString * const RED_WINE_KEY = @"Tinto";
static NSString * const WHITE_WINE_KEY = @"Blanco";

@interface AGTWineryModel ()

@property (strong, nonatomic) NSMutableArray *redWines;
@property (strong, nonatomic) NSMutableArray *whiteWines;
@property (strong, nonatomic) NSMutableArray *otherWines;

@end

@implementation AGTWineryModel

#pragma mark - Init

-(instancetype)init {
    if (self = [super init]) {
        
        NSError *error = nil;
//        NSString *description = [NSString stringWithFormat:@"Error while downloading the json data. Expect an array of dictionaries and got nil instead."];
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://static.keepcoding.io/baccus/wines.json"]];
        
        if (data) {
            //There was no error
            NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            if (JSONObjects) {
                //There was no error
                for (NSDictionary *dict in JSONObjects) {
                    AGTWineModel *wine = [[AGTWineModel alloc] initWithDictionary:dict];
                    
                    //Add the wine to its specific section
                    if ([wine.type isEqualToString:RED_WINE_KEY]) {
                        if (!self.redWines) {
                            self.redWines = [NSMutableArray arrayWithObject:wine];
                        } else {
                            [self.redWines addObject:wine];
                        }
                    } else if ([wine.type isEqualToString:WHITE_WINE_KEY]) {
                        if(!self.whiteWines) {
                            self.whiteWines = [NSMutableArray arrayWithObject:wine];
                        } else {
                            [self.whiteWines addObject:wine];
                        }
                    } else {
                        if (!self.otherWines) {
                            self.otherWines = [NSMutableArray arrayWithObject:wine];
                        } else {
                            [self.otherWines addObject:wine];
                        }
                    }
                }
            } else {
                //There was an error parsing the JSON
                NSLog(@"Error al parsear JSON: %@", error.localizedDescription);
            }
        } else {
            //Erro downloading the data
            NSLog(@"Error al descargar datos del servidor: %@", error.localizedDescription);
        }
        
    }
    
    return self;
}

#pragma mark - Querying the arrays

-(int)redWineCount {
    return (int) self.redWines.count;
}

-(int)whiteWineCount {
    return (int) self.whiteWines.count;
}

-(int)otherWineCount {
    return (int) self.otherWines.count;
}


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
