//
//  CustomCell.h
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UIImageView *movieImage;
    IBOutlet UILabel *movieTitle;
    IBOutlet UILabel *movieTime;
}

@property(nonatomic,strong) UIImageView *movieImage;
@property(nonatomic,strong) UILabel *movieTitle;
@property(nonatomic,strong) UILabel *movieTime;

@end
