//
//  Status+DataManager.h
//  Shai
//
//  Created by guoshencheng on 7/13/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "Status.h"
#import "StatusTool.h"
#import "CoreData+MagicalRecord.h"

@interface Status (DataManager)

+ (NSArray *)getAllStatus;
+ (NSArray *)getStatusTool;
+ (void)saveAllStatusWithStatuTools:(NSArray *)statusTools completion:(MRSaveCompletionHandler)completion;
+ (void)saveStatusWithStatusTool:(StatusTool *)statusTool completion:(MRSaveCompletionHandler)completion;

@end
