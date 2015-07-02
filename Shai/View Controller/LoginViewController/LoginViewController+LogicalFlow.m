//
//  LoginViewController+LogicalFlow.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "LoginViewController+LogicalFlow.h"
#import "HomeViewController.h"

@implementation LoginViewController (LogicalFlow)

#pragma mark - ApiserverDelegate

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
    if ([response success]) {
        [self.navigationController pushViewController:[HomeViewController create] animated:YES];
    }
}

@end
