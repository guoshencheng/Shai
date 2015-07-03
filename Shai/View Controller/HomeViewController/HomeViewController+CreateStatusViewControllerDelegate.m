//
//  HomeViewController+CreateStatusViewControllerDelegate.m
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+CreateStatusViewControllerDelegate.h"

@implementation HomeViewController (CreateStatusViewControllerDelegate)

- (void)createStatusViewControllerDidCreateNewStatus:(CreateStatusViewController *)createStatusViewController {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[ApiService serviceWithDelegate:self] sendJSONRequest:[ApiRequest requestForGetAllUserAllStatus]];
}

@end
