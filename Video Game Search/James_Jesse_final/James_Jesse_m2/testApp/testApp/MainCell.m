//
//  MainCell.m
//  testApp
//
//  Created by Jesse James on 2/11/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

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

- (void)customCellConfig:(NSDictionary *)gameObject
{
    self.cellTitleLabel.text = [gameObject objectForKey:@"game_title"];
}

@end
