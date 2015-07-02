//
//  StatusTool.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "StatusTool.h"

@implementation StatusTool

+ (instancetype)createWithNickName:(NSString *)nickName selfDecription:(NSString *)details location:(NSString *)location posterImage:(NSArray *)posterImageUrls userId:(NSInteger)userId statusId:(NSInteger)statusId{
    StatusTool *statusTool = [[StatusTool alloc] init];
    statusTool.nickName = nickName;
    statusTool.details = details;
    statusTool.location = location;
    statusTool.posterImageUrls = posterImageUrls;
    statusTool.userId = userId;
    return statusTool;
}

+ (instancetype)createWithNickName:(NSString *)nickName selfDecription:(NSString *)details location:(NSString *)location posterImage:(NSArray *)posterImageUrls sendDate:(NSDate *)sendDate avatarUrl:(NSString *)avatarUrl userId:(NSInteger)userId statusId:(NSInteger)statusId{
    StatusTool *statusTool = [StatusTool createWithNickName:nickName selfDecription:details location:location posterImage:posterImageUrls userId:userId statusId:statusId];
    statusTool.sendDate = sendDate;
    statusTool.avatarUrl = avatarUrl;
    return statusTool;
}

@end
