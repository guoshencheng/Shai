//
//  Status+DataManager.m
//  Shai
//
//  Created by guoshencheng on 7/13/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "Status+DataManager.h"
#import "User+DataManager.h"

@implementation Status (DataManager)

#pragma mark - PublicMethod

+ (NSArray *)getAllStatus {
    NSArray *status = [Status MR_findAll];
    if (status && status.count > 0) {
        return status;
    } else {
        return nil;
    }
}

+ (NSArray *)getStatusTool {
    NSMutableArray *statusTools = [[NSMutableArray alloc] init];
    NSArray *statuses = [Status getAllStatus];
    if (statuses && statuses.count > 0) {
        for (Status *status in statuses) {
            StatusTool *statusTool = [status changeToStatusTool];
            [statusTools addObject:statusTool];
        }
        return statusTools;
    } else {
        return nil;
    }
}

+ (void)saveAllStatusWithStatuTools:(NSArray *)statusTools completion:(MRSaveCompletionHandler)completion {
    NSDictionary *statusDictionary = [Status sortStatusByUsersWithStatusTools:statusTools];
    for (id key in statusDictionary.allKeys) {
        NSArray *oneUserStatusTools = [statusDictionary objectForKey:key];
        StatusTool *statusTool = [oneUserStatusTools objectAtIndex:0];
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            User *user = [User getOrCreateUserWithContext:localContext andUserId:statusTool.userId];
            user.userId = statusTool.userId;
            user.nickName = statusTool.nickName;
            user.avatarUrl = statusTool.avatarUrl;
            for (StatusTool *oneUserStatusTool in oneUserStatusTools) {
                Status * status = [Status saveStatusWithStatusTool:oneUserStatusTool inContext:localContext];
                status.user = user;
            }
        } completion:completion];
    }
}

+ (void)saveStatusWithStatusTool:(StatusTool *)statusTool completion:(MRSaveCompletionHandler)completion {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        [Status saveStatusWithStatusTool:statusTool inContext:localContext];
    } completion:completion];
}

#pragma mark - PrivateMethod

+ (NSDictionary *)sortStatusByUsersWithStatusTools:(NSArray *)statusTools {
    NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc] init];
    for (StatusTool *statusTool in statusTools) {
        if (![resultDictionary.allKeys containsObject:statusTool.userId]) {
            NSMutableArray *array = [[NSMutableArray alloc] init];
            [array addObject:statusTool];
            [resultDictionary setObject:array forKey:statusTool.userId];
        } else {
            NSMutableArray *array = [resultDictionary objectForKey:statusTool.userId];
            [array addObject:statusTool];
        }
    }
    return resultDictionary;
}

+ (Status *)saveStatusWithStatusTool:(StatusTool *)statusTool inContext:(NSManagedObjectContext *)context {
    Status *status = [Status getOrCreateStatusInfomationInContext:context withStatusId:@(statusTool.statusId)];
    [status saveStatusWithStatusTool:statusTool];
    return status;
}


+ (Status *)getOrCreateStatusInfomationInContext:(NSManagedObjectContext *)context withStatusId:(NSNumber *)statusId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"statusId == %d", statusId];
    NSArray *statuses = [Status MR_findAllWithPredicate:predicate inContext:context];
    if (statuses && statuses.count > 0) {
        return [statuses objectAtIndex:0];
    } else {
        return [Status MR_createInContext:context];
    }
}

+ (NSString *)changeImageUrlArrayToString:(NSArray *)imageUrls {
    NSString *imageUrlsString = @"";
    if (imageUrls && imageUrls.count > 1) {
        for (int i = 0; i < imageUrls.count; i ++) {
            if (i != 0) {
                imageUrlsString = [NSString stringWithFormat:@"%@,%@",imageUrlsString, [imageUrls objectAtIndex:i]];
            } else {
                imageUrlsString = [[imageUrls objectAtIndex:0] stringValue];
            }
        }
    }
    return imageUrlsString;
}

+ (NSArray *)changeImageUrlsStringToArray:(NSString *)imageUrlsString {
    return [imageUrlsString componentsSeparatedByString:@","];
}

- (StatusTool *)changeToStatusTool {
    StatusTool *statusTool = [[StatusTool alloc] init];
    statusTool.statusId = [self.statusId integerValue];
    statusTool.details = self.details;
    statusTool.location = self.location;
    statusTool.sendDate = self.referTime;
    statusTool.posterImageUrls = [Status changeImageUrlsStringToArray:self.imageUrls];
    statusTool.nickName = self.user.nickName;
    statusTool.userId = [NSString stringWithFormat:@"%@", self.user.userId];
    statusTool.avatarUrl = self.user.avatarUrl;
    return statusTool;
}

- (void)saveStatusWithStatusTool:(StatusTool *)statusTool {
    self.statusId = @(statusTool.statusId);
    self.details = statusTool.details;
    self.location = statusTool.location;
    self.referTime = statusTool.sendDate;
    self.imageUrls = [Status changeImageUrlArrayToString:statusTool.posterImageUrls];
}

@end
