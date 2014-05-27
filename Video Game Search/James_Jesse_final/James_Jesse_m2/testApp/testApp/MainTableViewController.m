//
//  FirstViewController.m
//  testApp
//
//  Created by Jesse James on 2/10/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "MainTableViewController.h"
#import "GamesCell.h"
#import "GameDetailViewController.h"
#import "GameClass.h"
#import "GameDetails.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController
@synthesize gameTitles, gameDetails, request, connection, url, requestData, spinner;

- (void)viewDidLoad
{
    [super viewDidLoad];
    numItems = 0;
    gamesArray = [[NSMutableArray alloc]init];
    gamesIdArray = [[NSMutableArray alloc]init];
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.frame = CGRectMake(0.0, 0.0, 320.0, 320.0);
    spinner.center = self.view.center;
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender
{
    if (((UIBarButtonItem*)sender).tag == 0)
    {
        if (searchBar.text != nil)
        {
            [searchBar resignFirstResponder];
            [gamesArray removeAllObjects];
            [gamesIdArray removeAllObjects];
            NSString *finalString = [searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
            url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://thegamesdb.net/api/GetGamesList.php?name=%@", finalString]];
            NSLog(@"%@", url);
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
            [self.tableView reloadData];
        } else if (searchBar.text == nil)
        {
            
        }
    } else if (((UIBarButtonItem*)sender).tag == 1)
    {
        [self.view setNeedsDisplay];
    }
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentElement = [[NSMutableString alloc] init];
    if([elementName isEqualToString:@"Game"])
    {
        gameTitles = [[GameClass alloc] init];
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
        if([elementName isEqualToString:@"GameTitle"])
        {
            gameTitles.name = currentElement;
            [gamesArray addObject:gameTitles];
    
        }
        if([elementName isEqualToString:@"id"])
        {
            gameTitles.gamesId = currentElement;
            [gamesIdArray addObject:currentElement];
        }
        if([elementName isEqualToString:@"ReleaseDate"])
        {
            gameTitles.gamesRelease = currentElement;
        }
        if([elementName isEqualToString:@"Platform"])
        {
            gameTitles.platform = currentElement;
            if(gamesArray)
            {
                gameTitles = [[GameClass alloc] initWithName:gameTitles.name gamesId:gameTitles.gamesId gamePlatform:gameTitles.platform gameRelease:gameTitles.gamesRelease];
                //NSLog(@"%@", gameTitles.name);
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
    //[spinner stopAnimating];
    //stop activity indicator
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return gamesArray.count;
}

- (NSData*)GetFileDataFromFile:(NSString*)filename
{
    NSString *filePath = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    filePath = [documentsDirectory stringByAppendingPathComponent:filename];
    if([fileManager fileExistsAtPath:filePath])
    {
        return [NSData dataWithContentsOfFile:filePath];
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    GamesCell *cell = (GamesCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[GamesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 320, 75)];
    av.backgroundColor = [UIColor clearColor];
    av.opaque = NO;
    av.image = [UIImage imageNamed:@"CustomMainCellBackground2.png"];
    cell.backgroundView = av;
    GameClass *gameName = [gamesArray objectAtIndex:indexPath.row];
    NSString *thisGamesName = [gameName valueForKey:@"name"];
    NSString *thisGamesPlatform = [gameName valueForKey:@"platform"];
    NSString *thisGamesId = [gameName valueForKey:@"gamesId"];
    NSString *thisGamesRelease = [gameName valueForKey:@"gamesRelease"];
    NSString *finalGameId = [thisGamesId stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    cell.gameTitle.text = thisGamesName;
    cell.gamePlatform.text = thisGamesPlatform;
    cell.gameRelease.text = thisGamesRelease;
    [spinner.layer setBackgroundColor:[[UIColor colorWithWhite:0.0 alpha:0.60] CGColor]];
    [spinner startAnimating];
    dispatch_queue_t queue = dispatch_queue_create(0, 0);
    dispatch_async(queue, ^{
        NSURL *imageUrl = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://thegamesdb.net/banners/boxart/original/front/%@-2.jpg", finalGameId]];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (image != nil) {
                cell.gameImage.image = image;
            } else
            {
                NSURL *imageUrl = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://thegamesdb.net/banners/boxart/original/front/%@-1.jpg", finalGameId]];
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
                cell.gameImage.image = image;
            }
            [spinner stopAnimating];
        });
    });
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showGameDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        GameDetailViewController *detailVC = segue.destinationViewController;
        NSDictionary *currentGame = [gamesArray objectAtIndex:indexPath.row];
        NSLog(@"%@", [gamesIdArray objectAtIndex:indexPath.row]);
        NSString *myNewGameId = [[gamesIdArray objectAtIndex:indexPath.row] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        detailVC.myGamesId = myNewGameId;
        detailVC.gameObject = currentGame;
        detailVC.isGameMyList = @"NO";
        detailVC.hidesBottomBarWhenPushed = YES;
    }
}
@end
