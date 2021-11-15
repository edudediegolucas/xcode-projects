//
//  InfoViewController.m
//  MoviesRecord
//
//  Created by Eduardo de Diego lucas on 8/1/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _labelTitle.text = _movieSelected.title;
    _labelDirector.text = _movieSelected.director;
    _labelStar.text = _movieSelected.star;
    _labelGenre.text = _movieSelected.genre;
    _imageCover.image = _movieSelected.cover;
    //Adjust the image
    _imageCover.contentMode = UIViewContentModeScaleAspectFit;
    _labelYear.text = @(_movieSelected.year).stringValue;
    _textPlot.text = _movieSelected.plot;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)shareButton:(id)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
