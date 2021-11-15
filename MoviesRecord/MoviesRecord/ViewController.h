//
//  ViewController.h
//  MoviesRecord
//
//  Created by Eduardo de Diego lucas on 5/1/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "NewMovieViewController.h"

@interface ViewController : UITableViewController <NewMovieViewControllerDelegate>

@property NSMutableArray *movies;


@end

