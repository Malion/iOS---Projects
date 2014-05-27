//
//  ThirdViewController.h
//  testApp
//
//  Created by Jesse James on 11/8/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray* gameArray;

@end
