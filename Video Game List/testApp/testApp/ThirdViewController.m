//
//  ThirdViewController.m
//  testApp
//
//  Created by Jesse James on 11/8/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "ThirdViewController.h"
#import "TableCell.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "ReadViewController.h"
#import "WriteViewController.h"
#import "DataRequest.h"

#define apiKey @"016a33bcf59f37200247030523c373ae3d6a5f3d"
#define gameUrl @"http://www.giantbomb.com/api/games/?api_key=016a33bcf59f37200247030523c373ae3d6a5f3d&limit=20&field_list=name,image,description&format=json"


@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Games", @"Games");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    DataRequest* request = [[DataRequest alloc] initWithDelegate:(id<DataRequestDelegate>)self];
    [request performSelectorInBackground:@selector(performRequestForURL:) withObject:gameUrl];
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableCell" bundle:nil] forCellReuseIdentifier:@"TableCell"];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)recievedResponse:(DataResponse*)response
{
    self.gameArray = [NSMutableArray arrayWithArray:response.gameArray];
    [self.tableView reloadData];
}

-(void)requestReturnedResponse:(DataResponse*)response
{
    [self performSelectorOnMainThread:@selector(recievedResponse:) withObject:response waitUntilDone:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.gameArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* currentgame = [self.gameArray objectAtIndex:indexPath.row];
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    if(currentgame != nil)
        {
        if(cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        NSDictionary *gameDictionary = [currentgame objectForKey:@"image"];
        if([[currentgame objectForKey:@"name"] isEqualToString: @"Hyperballoid Deluxe: Survival Pack"])
        {
            
        } else {
            NSURL *imageURL = [NSURL URLWithString:(NSString *)[gameDictionary objectForKey:@"tiny_url"]];
            NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
            UIImage *image = [[UIImage alloc] initWithData:imageData];
            [cell.imageView setImage:image];
        }
        cell.title.text = [NSString stringWithFormat:@"%@", [currentgame objectForKey:@"name"]];
        cell.rating.text = [currentgame objectForKey:@"contentAdvisoryRating"];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* currentgame = [self.gameArray objectAtIndex:indexPath.row];
    DetailViewController* detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailVC.object = currentgame;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
