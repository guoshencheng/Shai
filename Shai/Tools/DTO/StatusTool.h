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
@property (nonatomic, strong) NSString *selfDescription;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSArray *posterImageUrls;
@property (nonatomic, strong) NSDate *sendDate;

+ (instancetype)createWithNickName:(NSString *)nickName selfDecription:(NSString *)selfDescription location:(NSString *)location posterImage:(NSArray *)posterImageUrls sendDate:(NSDate *)sendDate avatarUrl:(NSString *)avatarUrl;
+ (instancetype)createWithNickName:(NSString *)nickName selfDecription:(NSString *)selfDescription location:(NSString *)location posterImage:(NSArray *)posterImageUrls;

@end
