//
//  StatusTool.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusTool : NSObject

@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, assign) NSInteger statusId;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSArray *posterImageUrls;
@property (nonatomic, strong) NSDate *sendDate;
@property (nonatomic, assign) NSInteger userId;

+ (instancetype)createWithNickName:(NSString *)nickName selfDecription:(NSString *)details location:(NSString *)location posterImage:(NSArray *)posterImageUrls sendDate:(NSDate *)sendDate avatarUrl:(NSString *)avatarUrl userId:(NSInteger)userId statusId:(NSInteger)statusId;
+ (instancetype)createWithNickName:(NSString *)nickName selfDecription:(NSString *)details location:(NSString *)location posterImage:(NSArray *)posterImageUrls userId:(NSInteger)userId statusId:(NSInteger)statusId;

@end
