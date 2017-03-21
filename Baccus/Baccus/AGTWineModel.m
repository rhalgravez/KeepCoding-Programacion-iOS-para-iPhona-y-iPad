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

#pragma mark - Init from JSON

-(instancetype) initWithDictionary:(NSDictionary *)aDictionary {
    return [self initWithName:[aDictionary objectForKey:@"name"]
              wineCompanyName:[aDictionary objectForKey:@"company"]
                         type:[aDictionary objectForKey:@"type"]
                       origin:[aDictionary objectForKey:@"origin"]
                       grapes:[self extractGrapesFromJSONArray:[aDictionary objectForKey:@"grapes"]]
               wineCompanyWeb:[aDictionary objectForKey:@"wine_web"]
                        notes:[aDictionary objectForKey:@"notes"]
                      raiting:[[aDictionary objectForKey:@"rating"] intValue]
                     photoURL:[NSURL URLWithString:[aDictionary objectForKey:@"picture"]]];
}

            
#pragma mark - Utils
-(NSArray *) extractGrapesFromJSONArray:(NSArray *)JSONArray {
    NSMutableArray *grapes = [NSMutableArray arrayWithCapacity:JSONArray.count];
    
    for (NSDictionary *dict in JSONArray) {
        [grapes addObject:[dict objectForKey:@"grapes"]];
    }
    return grapes;
}

-(NSArray *)packGrapesIntoJSONArray {
    NSMutableArray *jsonArray = [NSMutableArray arrayWithCapacity:self.grapes.count];
    for (NSString *grape in self.grapes) {
        [jsonArray addObject:@{@"grape": grape}];
    }
    return jsonArray;
}

-(NSDictionary *)proxyForJSON {
    return  @{@"name"           : self.name,
              @"company": self.wineCompanyName,
              @"wine_web"       : [self.wineCompanyWeb path],
              @"type"           : self.type,
              @"origin"         : self.origin,
              @"grapes"         : self.grapes,
              @"notes"          : self.notes,
              @"rating"         : @(self.rating),
              @"picture"        : [self.photoURL path]
              };
}

-(NSString *)description {
    return [NSString stringWithFormat:@"Name %@\nCompany name: %@\nType: %@\nOrigin: %@\nGrapes: %@\nWine comnay web: %@\nNotes: %@\n Rating: %d\n", self.name, self.wineCompanyName, self.type, self.origin, self.grapes, self.wineCompanyWeb, self.notes, self.rating];
}

@end
