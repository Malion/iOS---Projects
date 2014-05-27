//
//  TheaterInfo.m
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "TheaterInfo.h"

@implementation TheaterInfo
@synthesize nameOfTheater,locationOfTheater,theaterImage;

-(id)initWithTitle:(NSString*)nameTheater location:(NSString*)theaterLoc image:(UIImage*)theaterPic
{
    if ((self = [super init]))
    {
        nameOfTheater = nameTheater;
        locationOfTheater = theaterLoc;
        theaterImage = theaterPic;
    }
    return self;
}
@end