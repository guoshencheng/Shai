//
//  ThirdPartyTool.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "ThirdPartyTool.h"
#import "Owener+DataManager.h"

@implementation ThirdPartyTool

+ (instancetype)sharedInstance {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

#pragma mark - PublicMethod

- (void)registerApp {
    [WeiboSDK registerApp:WEIBO_APPKEY];
}

- (void)enableDebugMode:(BOOL)enable {
    [WeiboSDK enableDebugMode:enable];
}

- (BOOL)handleOpenURL:(NSURL *)url {
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (void)sendUserProfileRequestWithAccessToken:(NSString *)accessToken userid:(NSString *)userId {
    [WBHttpRequest requestWithAccessToken:accessToken url:WEIBO_USER_INFO_URL httpMethod:@"GET" params:@{@"uid":userId} delegate:self withTag:nil];
}

#pragma mark - WeiBoPublicMethod

+ (void)getWeiBoUserInfo {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = WEIBO_REDIRECT_URI;
    request.scope = @"all";
    request.userInfo = @{};
    [WeiboSDK sendRequest:request];
}

#pragma mark - WeiboSDKDelegate

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    if (response.statusCode == WeiboSDKResponseStatusCodeUserCancel) {
        return;
    }
    WBAuthorizeResponse *authorizeResponse = (WBAuthorizeResponse *)response;
    [Owener saveOwenerInfomationWithAccessToken:authorizeResponse.accessToken userId:[authorizeResponse.userID integerValue] avatarUrl:nil nickName:nil completion:nil];
    [self sendUserProfileRequestWithAccessToken:authorizeResponse.accessToken userid:authorizeResponse.userID];
}

#pragma mark - WBHttpRequestDelegate

- (void)request:(WBHttpRequest *)request didFinishLoadingWithDataResult:(NSData *)data {
    if ([request.url isEqualToString:WEIBO_USER_INFO_URL]) {
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSString *nickName = [result objectForKey:@"name"];
        NSString *avatar = [result objectForKey:@"profile_image_url"];
        if ([self.delegate respondsToSelector:@selector(thirdPartyTool:didLoginWithAvatarUrl:nickName:)]) {
            [self.delegate thirdPartyTool:self didLoginWithAvatarUrl:avatar nickName:nickName];
        }

    }
}

@end
