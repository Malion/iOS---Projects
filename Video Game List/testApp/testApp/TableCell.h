//
//  TableCell.h
//  testApp
//
//  Created by Jesse James on 11/9/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
