//
//  InfoViewController.h
//  MoviesRecord
//
//  Created by Eduardo de Diego lucas on 8/1/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface InfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelDirector;
@property (strong, nonatomic) IBOutlet UILabel *labelStar;
@property (strong, nonatomic) IBOutlet UILabel *labelYear;
@property (strong, nonatomic) IBOutlet UILabel *labelGenre;
@property (strong, nonatomic) IBOutlet UITextView *textPlot;
@property (strong, nonatomic) IBOutlet UIImageView *imageCover;

@property Movie *movieSelected;

@end
