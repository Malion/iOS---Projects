//
//  DataResponse.h
//  testApp
//
//  Created by Jesse James on 11/9/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataResponse : NSObject

@property (nonatomic, assign) NSInteger totalResults;
@property (nonatomic, strong) NSDictionary* originalResponse;
@property (nonatomic, strong) NSArray* movieArray;
@property (nonatomic, strong) NSArray* musicArray;
@property (nonatomic, strong) NSArray* gameArray;

@end
