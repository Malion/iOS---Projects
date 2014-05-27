//
//  SecondViewController.m
//  testApp
//
//  Created by Jesse James on 11/8/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "SecondViewController.h"
#import "TableCell.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "ReadViewController.h"
#import "WriteViewController.h"

#define musicUrl @"https://itunes.apple.com/search?term=jack+johnson&limit=25"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Music", @"Music");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    DataRequest* request = [[DataRequest alloc] initWithDelegate:(id<DataRequestDelegate>)self];
    [request performSelectorInBackground:@selector(performRequestForURL:) withObject:musicUrl];
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableCell" bundle:nil] forCellReuseIdentifier:@"TableCell"];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)recievedResponse:(DataResponse*)response
{
    self.musicArray = [NSMutableArray arrayWithArray:response.musicArray];
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
    return [self.musicArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* currentmusic = [self.musicArray objectAtIndex:indexPath.row];
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        //cell = [[TableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableCell"];
    }
    NSLog(@"%@", currentmusic);
    NSURL *imageURL = [NSURL URLWithString:(NSString *)[currentmusic objectForKey:@"artworkUrl60"]];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    [cell.imageView setImage:image];
    cell.title.text = [NSString stringWithFormat:@"%@", [currentmusic objectForKey:@"trackName"]];
    cell.rating.text = [currentmusic objectForKey:@"contentAdvisoryRating"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* currentmusic = [self.musicArray objectAtIndex:indexPath.row];
    NSLog(@"%@", currentmusic);
    DetailViewController* detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailVC.object = currentmusic;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
