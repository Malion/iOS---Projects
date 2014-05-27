//
//  MovieInfo.m
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "MovieInfo.h"

@implementation MovieInfo
@synthesize movieName,movieIcon,movieTimes,movieTrailer,movieLocation;

-(id)initWithTitle:(NSString*)icon mshowTimes:(NSArray*)showTimes names:(NSString*)movieTitle trailer:(NSURL*)trailerMov theaterLoc:(TheaterInfo *)theater{
    if ((self = [super init])) {
        movieIcon = icon;
        movieTimes = showTimes;
        movieName = movieTitle;
        movieTrailer = trailerMov;
        movieLocation = theater;
    }
    return self;
}

- (NSString*)timesForMovies
{
    NSString* movieShowings = @"";
    if (movieTimes.count > 0) {
        for (int i = 0; i < movieTimes.count; i++) {
            NSString* showTime = [movieTimes objectAtIndex:i];
            movieShowings = [movieShowings stringByAppendingFormat:@"%@ ", showTime];
        }
    }
    return movieShowings;
}

@end