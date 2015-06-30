//
//  LoginViewController.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewController+Configuration.h"
#import "WeiboSDK.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

+ (instancetype)create {
    return [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}

#pragma mark - Action

- (IBAction)didClickWeiBoLoginButton:(id)sender {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = @"https://api.weibo.com/oauth2/default.html";
    request.scope = @"all";
    request.userInfo = @{};
    [WeiboSDK sendRequest:request];
}


@end
