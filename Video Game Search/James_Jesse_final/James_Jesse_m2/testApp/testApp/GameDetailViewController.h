//
//  GameDetailViewController.h
//  testApp
//
//  Created by Jesse James on 2/10/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDetails.h"

@interface GameDetailViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    NSURLRequest *request;
    NSURLConnection *connection;
    NSURL *url;
    NSMutableData *requestData;
    NSString *_myGamesId;
    NSMutableString *currentElement;
    NSDictionary *_gameObject;
    NSMutableArray *gamesArray;
    NSDictionary *gamesJSON;
}

@property (retain, nonatomic) GameDetails *gameTitles;
@property (strong, nonatomic) NSURLRequest *request;
@property (strong, nonatomic) NSURLConnection *connection;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSMutableData *requestData;
@property (weak, nonatomic) NSString *myGamesId;
@property (weak, nonatomic) NSString *isGameMyList;
@property (weak, nonatomic) NSDictionary *gameObject;
@property (weak, nonatomic) IBOutlet UITextView *description;
@property (weak, nonatomic) IBOutlet UIImageView *gameImage;
@property (weak, nonatomic) IBOutlet UIImageView *gameRatingImage;
@property (weak, nonatomic) IBOutlet UILabel *genre;
@property (weak, nonatomic) IBOutlet UILabel *coop;
@property (weak, nonatomic) IBOutlet UILabel *players;
@property (weak, nonatomic) IBOutlet UILabel *platform;
@property (weak, nonatomic) IBOutlet UILabel *publisher;
@property (weak, nonatomic) IBOutlet UILabel *developer;



@end
