//
//  Owener+DataManager.m
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "Owener+DataManager.h"

@implementation Owener (DataManager)

+ (Owener *)getOwenserInfomation {
    NSArray *oweners = [Owener MR_findAll];
    if (oweners && oweners.count > 0) {
        return [oweners objectAtIndex:0];
    } else {
        return nil;
    }
}

+ (void)saveOwenerInfomationWithAccessToken:(NSString *)accessToken userId:(NSInteger)userId avatarUrl:(NSString *)avatarUrl nickName:(NSString *)nickName completion:(MRSaveCompletionHandler)completion {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        Owener *owener = [Owener getOrCreateOwenserInfomationInContext:localContext];
        owener.accessToken = accessToken;
        owener.userId = @(userId);
        owener.avatarUrl = avatarUrl;
        owener.nickName = nickName;
    } completion:completion];
}

+ (void)updateOwenInfomationWithAvatarUrl:(NSString *)avatarUrl nickName:(NSString *)nickName completion:(MRSaveCompletionHandler)completion {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        Owener *owener = [Owener getOrCreateOwenserInfomationInContext:localContext];
        owener.avatarUrl = avatarUrl;
        owener.nickName = nickName;
    } completion:completion];
}

#pragma mark - PrivateMethod 

+ (Owener *)getOrCreateOwenserInfomationInContext:(NSManagedObjectContext *)context {
    NSArray *oweners = [Owener MR_findAllInContext:context];
    if (oweners && oweners.count > 0) {
        return [oweners objectAtIndex:0];
    } else {
        return [Owener MR_createInContext:context];;
    }
}

@end
