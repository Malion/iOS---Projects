//
//  TrailerViewController.m
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "TrailerViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface TrailerViewController ()

@end

@implementation TrailerViewController
@synthesize movieDetails;
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
    movieImage.image = image;
    movieTitle.text = movieDetails.movieName;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)backClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)playStop:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSURL *movieURL = movieDetails.movieTrailer;
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    if (button.tag == 0) {        
        if (moviePlayer != nil)
        {
            [moviePlayer stop];
        }
    }
    else if (button.tag == 1)
    {
        [movieView addSubview:moviePlayer.view];
        moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, movieView.frame.size.width, movieView.frame.size.height);
        moviePlayer.fullscreen = NO;
        moviePlayer.controlStyle = MPMovieControlStyleNone;
        [moviePlayer play];
    }
}


@end
