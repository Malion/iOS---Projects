//
//  GameDetailViewController.m
//  testApp
//
//  Created by Jesse James on 2/10/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "GameDetailViewController.h"
#import "GameDetails.h"

@interface GameDetailViewController ()

@end

@implementation GameDetailViewController
@synthesize gameImage, gameObject, url, connection, request, requestData, myGamesId, gameTitles, gameRatingImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://thegamesdb.net/api/GetGame.php?id=%@", myGamesId]];
    request = [[NSURLRequest alloc] initWithURL:url];
    if( request != nil)
    {
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        requestData = [NSMutableData data];
        NSXMLParser *dataParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        if (dataParser != nil)
        {
            [dataParser setDelegate:self];
            [dataParser parse];
        }
    }
    NSURL *imageUrl = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://thegamesdb.net/banners/boxart/original/front/%@-2.jpg", myGamesId]];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
    if (image != nil) {
        gameImage.image = image;
    } else
    {
        NSURL *imageUrl = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://thegamesdb.net/banners/boxart/original/front/%@-1.jpg", myGamesId]];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
        gameImage.image = image;
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentElement = [[NSMutableString alloc] init];
    if([elementName isEqualToString:@"Game"])
    {
        gameTitles = [[GameDetails alloc] init];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (string != nil)
    {
        [currentElement appendString:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if(currentElement != nil)
    {
        NSLog(@"%@", currentElement);
        if([elementName isEqualToString:@"GameTitle"])
        {
            self.title = currentElement;
        }
        if([elementName isEqualToString:@"Overview"])
        {
            self.description.text = currentElement;
        }
        if([elementName isEqualToString:@"Platform"])
        {
            self.platform.text = currentElement;
        }
        if([elementName isEqualToString:@"Genre"])
        {
            self.genre.text = currentElement;
        }
        if([elementName isEqualToString:@"Co-op"])
        {
            self.coop.text = currentElement;
        }
        if([elementName isEqualToString:@"Players"])
        {
            self.players.text = currentElement;
        }
        if([elementName isEqualToString:@"Publisher"])
        {
            self.publisher.text = currentElement;
        }
        if([elementName isEqualToString:@"Developer"])
        {
            self.developer.text = currentElement;
        }
        if([elementName isEqualToString:@"ESRB"])
        {
            if([currentElement isEqualToString:@"M - Mature"])
            {
                self.gameRatingImage.image = [UIImage imageNamed:@"Mature.png"];
            } else if ([currentElement isEqualToString:@"T - Teen"])
            {
                self.gameRatingImage.image = [UIImage imageNamed:@"Teen.png"];
            } else if ([currentElement isEqualToString:@"E10+ - Everyone 10+"])
            {
                self.gameRatingImage.image = [UIImage imageNamed:@"E10.png"];
            } else if ([currentElement isEqualToString:@"E - Everyone"])
            {
                self.gameRatingImage.image = [UIImage imageNamed:@"Everyone.png"];
            }
        }
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(data != nil)
    {
        [requestData appendData:data];
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    if (requestString != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        if (documentsDirectory != nil)
        {
            NSString *fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"games.xml"];
            if(fullPath != nil)
            {
                [requestData writeToFile:fullPath atomically:true];
            }
        }
    }
}

@end
