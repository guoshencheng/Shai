//
//  LoginViewController+ThirdPartyToolDelegate.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "LoginViewController+ThirdPartyToolDelegate.h"

@implementation LoginViewController (ThirdPartyToolDelegate)

- (void)thirdPartyTool:(ThirdPartyTool *)thirdPartyTool didLoginWithUserId:(NSString *)userId avatarUrl:(NSString *)avatarUrl nickName:(NSString *)nickName {
    [[ApiService serviceWithDelegate:self] sendJSONRequest:[ApiRequest requestForLoginWithUserId:userId nickName:nickName avatarUrl:avatarUrl]];
}

@end
