//
//  MainCell.h
//  testApp
//
//  Created by Jesse James on 2/11/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UILabel *cellTitleLabel;

- (void)customCellConfig:(NSDictionary *)gameObject;

@end
