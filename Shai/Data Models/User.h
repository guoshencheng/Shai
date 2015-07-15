//
//  User.h
//  Shai
//
//  Created by guoshencheng on 7/15/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Status;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * avatarUrl;
@property (nonatomic, retain) NSString * nickName;
@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) NSSet *statuses;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addStatusesObject:(Status *)value;
- (void)removeStatusesObject:(Status *)value;
- (void)addStatuses:(NSSet *)values;
- (void)removeStatuses:(NSSet *)values;

@end
