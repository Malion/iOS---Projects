//
//  CustomCell.m
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize movieImage,movieTitle,movieTime;

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
