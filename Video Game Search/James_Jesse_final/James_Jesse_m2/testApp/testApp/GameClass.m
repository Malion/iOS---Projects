//
//  GameClass.m
//  testApp
//
//  Created by Jesse James on 2/17/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "GameClass.h"

@implementation GameClass
@synthesize name, gamesId, platform, overview, gamesRelease;



-(id)initWithName:(NSString*)gamesName gamesId:(NSString*)gameId gamePlatform:(NSString*)gamePlatform gameRelease:(NSString*)gameRelease
{
    if ((self = [super init]))
    {
        name = gamesName;
        gamesId = gameId;
        platform = gamePlatform;
        gamesRelease = gameRelease;
    }
    
    return self;
}

@end
