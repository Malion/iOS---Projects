//
//  WriteViewController.h
//  testApp
//
//  Created by Jesse James on 11/8/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedReviews.h"

@interface WriteViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UIButton *submit;
    IBOutlet UIButton *survey;
}

@property (strong, nonatomic) IBOutlet UITextView *review;
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) NSMutableArray *savedReviews;

-(IBAction)onClick:(id)sender;
-(IBAction)survey:(id)sender;

@end
