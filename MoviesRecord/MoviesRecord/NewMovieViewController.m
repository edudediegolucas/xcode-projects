//
//  NewMovieViewController.m
//  MoviesRecord
//
//  Created by Eduardo de Diego lucas on 11/1/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import "NewMovieViewController.h"

@interface NewMovieViewController ()

@end

@implementation NewMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)addMovie:(id)sender {
    Movie *movie = [[Movie alloc] init];
    movie.title = _textTitle.text;
    movie.director = _textDirector.text;
    movie.star = _textStar.text;
    movie.genre = _textGenre.text;
    movie.plot = _textPlot.text;
    movie.cover = _imageCover.image;
    movie.year = [_textYear.text intValue];
    
    [self.delegate newMoviewViewController:self createdNewMovie:movie];
}
- (IBAction)cancelMovie:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addCover:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{_imageCover.image = [info objectForKey:UIImagePickerControllerOriginalImage];}];
}

@end
