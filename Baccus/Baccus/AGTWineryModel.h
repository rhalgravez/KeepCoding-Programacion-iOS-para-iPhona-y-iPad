//
//  AGTWineryModel.h
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/7/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTWineModel.h"

@interface AGTWineryModel : NSObject

@property (readonly, nonatomic) int redWineCount;
@property (readonly, nonatomic) int whiteWineCount;
@property (readonly, nonatomic) int otherWineCount;

-(AGTWineModel *)redWineAtIndex:(int)index;
-(AGTWineModel *)whiteWineAtIndex:(int)index;
-(AGTWineModel *)otherWineAtIndex:(int)index;

@end
