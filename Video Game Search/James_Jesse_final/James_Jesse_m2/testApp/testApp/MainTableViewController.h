//
//  FirstViewController.h
//  testApp
//
//  Created by Jesse James on 2/10/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameClass.h"
#import "GameDetails.h"

@interface MainTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    NSURLRequest *request;
    NSURLConnection *connection;
    NSURL *url;
    NSMutableData *requestData;
    NSMutableArray *gamesArray;
    NSMutableArray *gamesIdArray;
    NSMutableString *currentElement;
    NSInteger *numItems;
    UIActivityIndicatorView *spinner;
    IBOutlet UIBarButtonItem *refresh;
    IBOutlet UIBarButtonItem *search;
    IBOutlet UISearchBar *searchBar;
}

@property (retain, nonatomic) GameClass *gameTitles;
@property (retain, nonatomic) GameDetails *gameDetails;
@property (strong, nonatomic) NSURLRequest *request;
@property (strong, nonatomic) NSURLConnection *connection;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSMutableData *requestData;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;

- (IBAction)onClick:(id)sender;

@end
