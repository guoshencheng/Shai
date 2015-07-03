//
//  Owener+DataManager.h
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "Owener.h"
#import "CoreData+MagicalRecord.h"

@interface Owener (DataManager)

+ (Owener *)getOwenserInfomation;
+ (void)saveOwenerInfomationWithAccessToken:(NSString *)accessToken userId:(NSInteger)userId avatarUrl:(NSString *)avatarUrl nickName:(NSString *)nickName completion:(MRSaveCompletionHandler)completion;
+ (void)updateOwenInfomationWithAvatarUrl:(NSString *)avatarUrl nickName:(NSString *)nickName completion:(MRSaveCompletionHandler)completion;

@end
