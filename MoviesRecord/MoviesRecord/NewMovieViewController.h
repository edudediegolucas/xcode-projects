//
//  NewMovieViewController.h
//  MoviesRecord
//
//  Created by Eduardo de Diego lucas on 11/1/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@class NewMovieViewController;

@protocol NewMovieViewControllerDelegate <NSObject>

-(void)newMoviewViewController:(NewMovieViewController *)controller createdNewMovie:(Movie *)newMovie;

@end

@interface NewMovieViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textTitle;
@property (strong, nonatomic) IBOutlet UITextField *textYear;
@property (strong, nonatomic) IBOutlet UITextField *textDirector;
@property (strong, nonatomic) IBOutlet UITextField *textStar;
@property (strong, nonatomic) IBOutlet UITextField *textGenre;
@property (strong, nonatomic) IBOutlet UITextView *textPlot;
@property (strong, nonatomic) IBOutlet UIImageView *imageCover;
@property (weak, nonatomic) id <NewMovieViewControllerDelegate> delegate;
@property NSMutableArray *movies;

@end
