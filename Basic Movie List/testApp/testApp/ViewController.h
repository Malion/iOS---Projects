//
//  ViewController.h
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *mainTable;
    NSMutableArray *theaters;
    NSMutableArray *movies;
    NSMutableArray *movies2;
    NSMutableArray *movies3;
    NSMutableArray *allMovies;
}
@end
