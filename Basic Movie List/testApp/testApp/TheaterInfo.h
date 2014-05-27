//
//  TheaterInfo.h
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheaterInfo : NSObject
{
    NSString *nameOfTheater;
    NSString *locationOfTheater;
    UIImage *theaterImage;
}

-(id)initWithTitle:(NSString*)nameTheater location:(NSString*)theaterLoc image:(UIImage*)theaterPic;
@property (nonatomic,strong) NSString *nameOfTheater;
@property (nonatomic,strong) NSString *locationOfTheater;
@property (nonatomic,strong) UIImage *theaterImage;
@end