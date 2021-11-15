//
//  Movie.h
//  MoviesRecord
//
//  Created by Eduardo de Diego lucas on 5/1/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property NSString *title;
@property NSString *genre;
@property int year;
@property NSString *director;
@property NSString *star;
@property NSString *company;
@property UIImage *cover;
@property NSString *plot;

@end
