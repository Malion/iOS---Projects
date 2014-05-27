//
//  MovieInfo.h
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TheaterInfo.h"
@interface MovieInfo : NSObject
{
    NSString *movieIcon;
    NSArray *movieTimes;
    NSString *movieName;
    NSURL *movieTrailer;
    TheaterInfo *movieLocation;
}
-(id)initWithTitle:(NSString*)icon mshowTimes:(NSArray*)showTimes names:(NSString*)movieTitle trailer:(NSURL*)trailerMov theaterLoc:(TheaterInfo*)theater;
- (NSString*)timesForMovies;
@property(nonatomic,strong) NSString *movieIcon;
@property(nonatomic,strong) NSArray *movieTimes;
@property(nonatomic,strong) NSString *movieName;
@property(nonatomic,strong)NSURL *movieTrailer;
@property(nonatomic,strong)TheaterInfo *movieLocation;
@end