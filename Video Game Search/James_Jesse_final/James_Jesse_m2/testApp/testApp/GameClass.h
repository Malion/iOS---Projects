//
//  GameClass.h
//  testApp
//
//  Created by Jesse James on 2/17/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameClass : NSObject
{
    NSString *name;
    NSString *gamesId;
    NSString *platform;
    NSString *overview;
    NSString *gamesRelease;
}

@property (retain, nonatomic)NSString *name;
@property (retain, nonatomic)NSString *gamesId;
@property (retain, nonatomic)NSString *platform;
@property (retain, nonatomic)NSString *overview;
@property (retain, nonatomic)NSString *gamesRelease;

-(id)initWithName:(NSString*)gamesName gamesId:(NSString*)gameId gamePlatform:(NSString*)gamePlatform gameRelease:(NSString*)gameRelease;

@end
