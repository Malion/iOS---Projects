//
//  MyListCell.m
//  testApp
//
//  Created by Jesse James on 2/18/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "MyListCell.h"

@implementation MyListCell

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
