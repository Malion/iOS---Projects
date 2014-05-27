//
//  TrailerViewController.h
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MovieInfo.h"
#import "TheaterInfo.h"
#import "DetailViewController.h"
@interface TrailerViewController : UIViewController
{
    IBOutlet UILabel *movieTitle;
    IBOutlet UIView *movieView;
    IBOutlet UIImageView *movieImage;    
    MPMoviePlayerController *moviePlayer;
}

-(IBAction)backClick:(id)sender;
-(IBAction)playStop:(id)sender;
@property (nonatomic,strong)MovieInfo *movieDetails;
@end