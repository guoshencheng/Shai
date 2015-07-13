//
//  User.h
//  Shai
//
//  Created by guoshencheng on 7/13/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Status;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * avatarUrl;
@property (nonatomic, retain) NSString * nickName;
@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) Status *statuses;

@end
