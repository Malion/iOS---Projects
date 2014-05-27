//
//  DataHandling.m
//  testApp
//
//  Created by Jesse James on 11/9/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "DataRequest.h"

@interface DataRequest()
@property (nonatomic, weak) id<DataRequestDelegate> delegate;
@end

@implementation DataRequest
@synthesize delegate = _delegate;
@synthesize tempArray;

-(DataRequest*)init
{
    @throw [NSException exceptionWithName:@"Invalid Init" reason:@"init only with delegate" userInfo:nil];
    return nil;
}

-(DataRequest*)initWithDelegate:(id<DataRequestDelegate>)requestDelegate
{
    NSParameterAssert(requestDelegate);
    if (self = [super init])
    {
        _delegate = requestDelegate;
    }
    return self;
}

-(void)performRequestForURL:(NSString*)url
{
    NSParameterAssert(url);
    DataResponse* response = [[DataResponse alloc] init];
    NSMutableData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    if(data)
    {
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(json)
        {
            if([url isEqualToString:@"http://itunes.apple.com/search?term=james+cameron&media=movie&entity=movie&attribute=producerTerm&limit=20"])
            {
            response.movieArray = [json objectForKey:@"results"];
            }
            else if ([url isEqualToString:@"https://itunes.apple.com/search?term=jack+johnson&limit=25"])
            {
            response.musicArray = [json objectForKey:@"results"];
            }
            else if([url isEqualToString:@"http://www.giantbomb.com/api/games/?api_key=016a33bcf59f37200247030523c373ae3d6a5f3d&limit=20&field_list=name,image,description&format=json"])
            {
                response.gameArray = [json objectForKey:@"results"];
            }
        }
    }
    if(_delegate && [_delegate respondsToSelector:@selector(requestReturnedResponse:)])
    {
        [_delegate requestReturnedResponse:response];
    }

}

@end
