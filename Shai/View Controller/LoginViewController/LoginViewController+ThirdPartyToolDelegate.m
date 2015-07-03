//
//  LoginViewController+ThirdPartyToolDelegate.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "LoginViewController+ThirdPartyToolDelegate.h"
#import "Owener+DataManager.h"

@implementation LoginViewController (ThirdPartyToolDelegate)

- (void)thirdPartyTool:(ThirdPartyTool *)thirdPartyTool didLoginWithAvatarUrl:(NSString *)avatarUrl nickName:(NSString *)nickName {
    thirdPartyTool.delegate = nil;
    [Owener updateOwenInfomationWithAvatarUrl:avatarUrl nickName:nickName completion:^(BOOL success, NSError *error) {
        Owener *owner = [Owener getOwenserInfomation];
        [[ApiService serviceWithDelegate:self] sendJSONRequest:[ApiRequest requestForLoginWithUserId:[owner.userId stringValue] nickName:nickName avatarUrl:avatarUrl]];
    }];
}

@end
