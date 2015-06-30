//
//  StatusTool.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "StatusTool.h"

@implementation StatusTool

+ (instancetype)createWithNickName:(NSString *)nickName selfDecription:(NSString *)selfDescription location:(NSString *)location posterImage:(NSArray *)posterImageUrls {
    StatusTool *statusTool = [[StatusTool alloc] init];
    statusTool.nickName = nickName;
    statusTool.selfDescription = selfDescription;
    statusTool.location = location;
    statusTool.posterImageUrls = posterImageUrls;
    return statusTool;
}

+ (instancetype)createWithNickName:(NSString *)nickName selfDecription:(NSString *)selfDescription location:(NSString *)location posterImage:(NSArray *)posterImageUrls sendDate:(NSDate *)sendDate avatarUrl:(NSString *)avatarUrl {
    StatusTool *statusTool = [StatusTool createWithNickName:nickName selfDecription:selfDescription location:location posterImage:posterImageUrls];
    statusTool.sendDate = sendDate;
    statusTool.avatarUrl = avatarUrl;
    return statusTool;
}

@end
