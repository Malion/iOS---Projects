//
//  CustomTheaterCell.h
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTheaterCell : UIView
{
    IBOutlet UILabel *theaterName;
    IBOutlet UILabel *theaterLocation;
    IBOutlet UIImageView *theaterImage;
}
@property (nonatomic,strong) UILabel *theaterName;
@property (nonatomic,strong) UILabel *theaterLocation;
@property (nonatomic,strong) UIImageView *theaterImage;
@end
