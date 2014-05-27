//
//  DetailViewController.m
//  testApp
//
//  Created by Jesse James on 11/8/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "DetailViewController.h"
#import "ReadViewController.h"
#import "WriteViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    if(self.object)
    {
        if([self.object objectForKey:@"artworkUrl100"] != nil)
        {
            NSURL *imageURL = [NSURL URLWithString:(NSString *)[self.object objectForKey:@"artworkUrl100"]];
            NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
            UIImage *image = [[UIImage alloc] initWithData:imageData];
            [self.thumb setImage:image];
            self.navigationItem.title = [NSString stringWithFormat:@"%@", [self.object objectForKey:@"trackName"]];
            if([self.object objectForKey:@"longDescription"] != nil)
            {
                self.description.text = [NSString stringWithFormat:@"%@", [self.object objectForKey:@"longDescription"]];
            } else if ([self.object objectForKey:@"collectionName"] != nil)
            {
                self.description.text = [NSString stringWithFormat:@"Album Name:\n%@", [self.object objectForKey:@"collectionName"]];
            }
            if([self.object objectForKey:@"contentAdvisoryRating"] != nil)
            {
                self.rating.text = [NSString stringWithFormat:@"%@", [self.object objectForKey:@"contentAdvisoryRating"]];
            } else if ([self.object objectForKey:@"primaryGenreName"] != nil)
            {
                self.rating.text = [NSString stringWithFormat:@"%@", [self.object objectForKey:@"primaryGenreName"]];
                self.ratingLabel.text = [NSString stringWithFormat:@"Genre:"];
            }
        }
        else if ([self.object objectForKey:@"image"] != nil)
        {
            NSDictionary *gameDictionary = [self.object objectForKey:@"image"];
            if([[self.object objectForKey:@"name"] isEqualToString: @"Hyperballoid Deluxe: Survival Pack"])
            {
                
            } else {
                NSURL *imageURL = [NSURL URLWithString:(NSString *)[gameDictionary objectForKey:@"small_url"]];
                NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
                UIImage *image = [[UIImage alloc] initWithData:imageData];
                [self.thumb setImage:image];
            }
            self.navigationItem.title = [NSString stringWithFormat:@"%@", [self.object objectForKey:@"name"]];
            NSString* descriptionString = [self.object objectForKey:@"description"];
            //NSString* cleanedString = [descriptionString stringByTrimmingCharactersInSet:[NSCharacterSet symbolCharacterSet]];
            self.description.text = descriptionString;
            self.rating.text = [self.object objectForKey:@"contentAdvisoryRating"];
        }
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if(button == read)
    {
        ReadViewController* readVC = [[ReadViewController alloc] initWithNibName:@"ReadViewController" bundle:nil];
        [self.navigationController pushViewController:readVC animated:YES];
    }
    else if(button == write)
    {
        WriteViewController* writeVC = [[WriteViewController alloc] initWithNibName:@"WriteViewController" bundle:nil];
        [self.navigationController pushViewController:writeVC animated:YES];
    }
}

@end
