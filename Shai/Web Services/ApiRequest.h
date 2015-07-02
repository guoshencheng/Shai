//
//  ApiRequest.h
//  ArchitectureProject
//
//  Created by guoshencheng on 6/16/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ApiRequestMethodGet,
    ApiRequestMethodPost,
    ApiRequestMethodPostImage,
} ApiRequestMethod;

@interface ApiRequest : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, assign) ApiRequestMethod method;
@property (nonatomic, strong) UIImage *image;

+ (instancetype)requestForTestServer;
+ (instancetype)requestForLoginWithUserId:(NSString *)userId nickName:(NSString *)nickName avatarUrl:(NSString *)avatarUrl;
- (NSString *)assembleParameters;

@end
