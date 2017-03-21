//
//  AGTWineModel.m
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/1/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import "AGTWineModel.h"

static int const NO_RATING = -1;

@implementation AGTWineModel

//When creating a readonly property with a acustom getter, the compiler think it´s not
//going to need an instance variable. Bu we are going to need it, so we have to put our own
//synthesize

@synthesize  photo = _photo;

#pragma mark -  Properties
-(UIImage *)photo {
    //This is going to block the app for a second, but because we don´t know
    //how to do it in background, for the moment we are going to to it like this
    
    //Lazy loading
    if (!_photo) {
        _photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.photoURL]];
    }
    return _photo;
}


#pragma mark -  Class Constructor Methods

+(instancetype) wineWithName: (NSString *)aName
             wineCompanyName: (NSString *) aWineCompanyName
                        type: (NSString *)  aType
                      origin: (NSString *) anOrigin
                      grapes: (NSArray *) arrayOfGrapes
              wineCompanyWeb: (NSURL *) aURL
                       notes: (NSString *) aNotes
                     raiting: (int) aRating
                    photoURL: (NSURL *)aPhotoURL {
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin
                               grapes:arrayOfGrapes
                       wineCompanyWeb:aURL
                                notes:aNotes
                              raiting:aRating
                             photoURL: aPhotoURL];
}

+(instancetype) wineWithName: (NSString *) aName
             wineCompanyName: (NSString *) aWineCompanyName
                        type: (NSString *) aType
                      origin: (NSString *) anOrigin {
    
    return  [[self alloc] initWithName:aName
                       wineCompanyName:aWineCompanyName
                                  type:aType
                                origin:anOrigin];
}

#pragma mark - Init

-(instancetype) initWithName: (NSString *)aName
             wineCompanyName: (NSString *) aWineCompanyName
                        type: (NSString *)  aType
                      origin: (NSString *) anOrigin
                      grapes: (NSArray *) arrayOfGrapes
              wineCompanyWeb: (NSURL *) aURL
                       notes: (NSString *) aNotes
                     raiting: (int) aRating
                    photoURL: (NSURL *) aPhotoURL {
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
        _photoURL = aPhotoURL;
    }
    
    return self;
}

-(instancetype) initWithName: (NSString *) aName
             wineCompanyName: (NSString *) aWineCompanyName
                        type: (NSString *) aType
                      origin: (NSString *) anOrigin {
    
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:anOrigin
                       grapes:nil
               wineCompanyWeb:nil
                        notes:nil
                      raiting:NO_RATING
                     photoURL:nil];
}

@end
