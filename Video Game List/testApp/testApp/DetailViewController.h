//
//  DetailViewController.h
//  testApp
//
//  Created by Jesse James on 11/8/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UIButton *read;
    IBOutlet UIButton *write;
}

@property (weak,nonatomic) NSDictionary *object;
@property (weak,nonatomic) IBOutlet UIImageView *thumb;
@property (weak,nonatomic) IBOutlet UITextView *description;
@property (weak,nonatomic) IBOutlet UILabel *rating;
@property (weak,nonatomic) IBOutlet UILabel *ratingLabel;

-(IBAction)onClick:(id)sender;
@end
