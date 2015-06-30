//
//  LoginViewController+Configuration.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "LoginViewController+Configuration.h"

@implementation LoginViewController (Configuration)

- (void)configureViews {
    [self configureWeiBoLoginButton];
}

- (void)configureWeiBoLoginButton {
    self.weiboButton.layer.cornerRadius = self.weiboButton.frame.size.width / 2;
    self.weiboButton.layer.borderWidth = 2;
    self.weiboButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

@end
