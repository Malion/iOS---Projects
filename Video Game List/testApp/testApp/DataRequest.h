//
//  DataHandling.h
//  testApp
//
//  Created by Jesse James on 11/9/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataResponse.h"

@protocol DataRequestDelegate <NSObject>

@required
-(void)requestReturnedResponse:(DataResponse*)response;

@end

@interface DataRequest: NSObject

@property (nonatomic, weak) NSArray *tempArray;

-(DataRequest*)initWithDelegate:(id<DataRequestDelegate>)requestDelegate;

-(void)performRequestForURL:(NSString*)url;

@end
