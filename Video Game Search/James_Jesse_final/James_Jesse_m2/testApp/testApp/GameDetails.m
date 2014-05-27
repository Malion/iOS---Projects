//
//  GameDetails.m
//  testApp
//
//  Created by Jesse James on 2/17/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "GameDetails.h"
#import "GameClass.h"

@implementation GameDetails
@synthesize name, gamesId, platform, overview;


-(id)initWithName:(NSString*)gamesName gamesId:(NSString*)gameId gamePlatform:(NSString*)gamePlatform
{
    if ((self = [super init]))
    {
        name = gamesName;
        gamesId = gameId;
        platform = gamePlatform;
    }
    
    return self;
}

@end
