//
//  User+DataManager.m
//  Shai
//
//  Created by guoshencheng on 7/13/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "User+DataManager.h"
#import "CoreData+MagicalRecord.h"

@implementation User (DataManager)

+ (User *)getOrCreateUserWithContext:(NSManagedObjectContext *)context andUserId:(NSInteger)userId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userId == %d",userId];
    NSArray *users = [User MR_findAllWithPredicate:predicate inContext:context];
    if (users && users.count > 0) {
        return [users objectAtIndex:0];
    } else {
        return [User MR_createInContext:context];
    }
}



@end
