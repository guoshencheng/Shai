//
//  ThirdPartyTool.h
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboSDK.h"
#import "ThirdPartyUrl.h"

@protocol ThirdPartyToolDelegate;
@interface ThirdPartyTool : NSObject <WeiboSDKDelegate, WBHttpRequestDelegate>

@property (weak, nonatomic) id<ThirdPartyToolDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)registerApp;
- (BOOL)handleOpenURL:(NSURL *)url;
- (void)enableDebugMode:(BOOL)enable;

+ (void)getWeiBoUserInfo;
- (void)sendUserProfileRequestWithAccessToken:(NSString *)accessToken userid:(NSString *)userId;

@end

@protocol ThirdPartyToolDelegate <NSObject>
@optional
- (void)thirdPartyTool:(ThirdPartyTool *)thirdPartyTool didLoginWithAvatarUrl:(NSString *)avatarUrl nickName:(NSString *)nickName;

@end