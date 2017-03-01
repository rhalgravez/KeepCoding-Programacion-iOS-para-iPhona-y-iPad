//
//  AGTWineModel.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/1/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTWineModel.h"

@implementation AGTWineModel

-(instancetype) initWithName: (NSString *)aName
             wineCompanyName: (NSString *) aWineCompanyName
                        type: (NSString *)  aType
                      origin: (NSString *) anOrigin
                      grapes: (NSArray *) arrayOfGrapes
              wineCompanyWeb: (NSURL *) aURL
                       notes: (NSString *) aNotes
                     raiting: (int) aRating
                       photo: (UIImage *) aPhoto {
    if (self = [super init]) {
        //Assigning the parameters to the instance variables
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = anOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aURL;
        _notes = aNotes;
        _rating = aRating;
        _photo = aPhoto;
    }
    
    return self;
}

@end
