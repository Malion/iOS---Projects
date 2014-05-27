//
//  FirstViewController.m
//  testApp
//
//  Created by Jesse James on 11/8/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "FirstViewController.h"
#import "TableCell.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "ReadViewController.h"
#import "WriteViewController.h"
#define movieUrl @"http://itunes.apple.com/search?term=james+cameron&media=movie&entity=movie&attribute=producerTerm&limit=20"



@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Movies", @"Movies");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    DataRequest* request = [[DataRequest alloc] initWithDelegate:(id<DataRequestDelegate>)self];
    [request performSelectorInBackground:@selector(performRequestForURL:) withObject:movieUrl];
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableCell" bundle:nil] forCellReuseIdentifier:@"TableCell"];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)recievedResponse:(DataResponse*)response
{
    self.movieArray = [NSMutableArray arrayWithArray:response.movieArray];
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
    return [self.movieArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* currentMovie = [self.movieArray objectAtIndex:indexPath.row];
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        //cell = [[TableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableCell"];
    }
    NSURL *imageURL = [NSURL URLWithString:(NSString *)[currentMovie objectForKey:@"artworkUrl100"]];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    [cell.imageView setImage:image];
    cell.title.text = [NSString stringWithFormat:@"%@", [currentMovie objectForKey:@"trackName"]];
    cell.rating.text = [currentMovie objectForKey:@"contentAdvisoryRating"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* currentMovie = [self.movieArray objectAtIndex:indexPath.row];
    
    DetailViewController* detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailVC.object = currentMovie;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
