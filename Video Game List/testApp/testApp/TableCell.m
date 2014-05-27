//
//  TableCell.m
//  testApp
//
//  Created by Jesse James on 11/9/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
@synthesize title = _title;
@synthesize rating = _rating;
@synthesize image = _image;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
