//
//  Status.h
//  Shai
//
//  Created by guoshencheng on 7/13/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Status : NSManagedObject

@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSDate * referTime;
@property (nonatomic, retain) NSNumber * statusId;
@property (nonatomic, retain) NSString * imageUrls;
@property (nonatomic, retain) User *user;

@end
