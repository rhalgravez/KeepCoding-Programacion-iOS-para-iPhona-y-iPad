//
//  AGTWineModel.h
//  Baccus
//
//  Created by Roberto Manuel Halgravez Perea on 3/1/17.
//  Copyright © 2017 RHalgravez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTWineModel : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic, readonly) UIImage *photo;
@property (strong, nonatomic) NSURL *photoURL;
@property (strong, nonatomic) NSURL *wineCompanyWeb;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSString *origin;
@property (nonatomic) int rating; //0 - 5
@property (strong, nonatomic) NSArray *grapes;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *wineCompanyName;


#pragma mark -  Class Constructor Methods

+(instancetype)new NS_UNAVAILABLE;

+(instancetype) wineWithName: (NSString *)aName
             wineCompanyName: (NSString *) aWineCompanyName
                        type: (NSString *)  aType
                      origin: (NSString *) anOrigin
                      grapes: (NSArray *) arrayOfGrapes
              wineCompanyWeb: (NSURL *) aURL
                       notes: (NSString *) aNotes
                     raiting: (int) aRating
                       photoURL: (NSURL *)aPhotoURL;

+(instancetype) wineWithName: (NSString *) aName
             wineCompanyName: (NSString *) aWineCompanyName
                        type: (NSString *) aType
                      origin: (NSString *) anOrigin;

#pragma mark - Init

-(instancetype) initWithName: (NSString *)aName
             wineCompanyName: (NSString *) aWineCompanyName
                        type: (NSString *)  aType
                      origin: (NSString *) anOrigin
                      grapes: (NSArray *) arrayOfGrapes
              wineCompanyWeb: (NSURL *) aURL
                       notes: (NSString *) aNotes
                     raiting: (int) aRating
                    photoURL: (NSURL *) aPhotoURL NS_DESIGNATED_INITIALIZER;

-(instancetype)init NS_UNAVAILABLE;

-(instancetype) initWithName: (NSString *) aName
             wineCompanyName: (NSString *) aWineCompanyName
                        type: (NSString *) aType
                      origin: (NSString *) anOrigin;

@end
