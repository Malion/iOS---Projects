//
//  DetailViewController.m
//  testApp
//
//  Created by Jesse James on 12/19/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "DetailViewController.h"
#import "MovieInfo.h"
#import "TheaterInfo.h"
#import "TrailerViewController.h"
#import "ViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize detailMovieImage,detailMovieTitle,detailShowTimes,movieArray,movieDetails;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    NSURL * imageURL = [NSURL URLWithString:movieDetails.movieIcon];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    detailMovieTitle.text = movieDetails.movieName;
    detailMovieImage.image = image;
    detailShowTimes.text = [movieDetails timesForMovies];    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(IBAction)trailerClick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if (button.tag == 1) {
        TrailerViewController *trailerView = [[TrailerViewController alloc]initWithNibName:@"TrailerViewController" bundle:nil];
        if (trailerView != nil) {
            trailerView.movieDetails = movieDetails;
            [self presentViewController:trailerView animated:YES completion:nil];
        }
    }
}

-(IBAction)backClick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if (button.tag == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

@end

