//
//  User+DataManager.h
//  Shai
//
//  Created by guoshencheng on 7/13/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "User.h"

@interface User (DataManager)

+ (User *)getOrCreateUserWithContext:(NSManagedObjectContext *)context andUserId:(NSInteger)userId;

@end
