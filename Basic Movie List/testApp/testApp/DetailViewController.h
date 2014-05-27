//
//  DetailViewController.h
//  testApp
//
//  Created by Jesse James on 12/19/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfo.h"
#import "TheaterInfo.h"
@interface DetailViewController : UIViewController
{
    IBOutlet UIImageView *detailMovieImage;
    IBOutlet UILabel *detailMovieTitle;
    IBOutlet UILabel *detailShowTimes;
    NSArray *movieArray;
}

-(IBAction)backClick:(id)sender;
-(IBAction)trailerClick:(id)sender;

@property (nonatomic,strong)MovieInfo *movieDetails;
@property (nonatomic,strong)UIImageView *detailMovieImage;
@property (nonatomic,strong)UILabel *detailMovieTitle;
@property (nonatomic,strong)UILabel *detailShowTimes;
@property (nonatomic,strong)NSArray *movieArray;
@end