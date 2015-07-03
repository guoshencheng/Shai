//
//  User.h
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Status;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * avatarUrl;
@property (nonatomic, retain) NSString * nickName;
@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) Status *statuses;

@end
