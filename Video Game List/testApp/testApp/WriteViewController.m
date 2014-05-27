//
//  WriteViewController.m
//  testApp
//
//  Created by Jesse James on 11/8/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "WriteViewController.h"

@interface WriteViewController ()

@end

@implementation WriteViewController

@synthesize savedReviews;

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
    //SavedReviews *reviews = [[SavedReviews alloc] init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"You entered %@", self.myTextField.text);
    NSLog(@"You also entered %@", self.review.text);
    [self.review resignFirstResponder];
    [self.myTextField resignFirstResponder];
    return YES;
}



-(IBAction)onClick:(id)sender
{
    
}

-(IBAction)survey:(id)sender
{
    NSURL *url = [[NSURL alloc] initWithString:@"https://drive.google.com/file/d/0B_4yQ0rGhev3STlxTW4yNVhqeTg/edit?usp=sharing"];
    [[UIApplication sharedApplication] openURL:url];
}

@end
