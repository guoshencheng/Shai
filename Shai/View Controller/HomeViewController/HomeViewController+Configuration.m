//
//  HomeViewController+Configuration.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+Configuration.h"

@implementation HomeViewController (Configuration)

#pragma mark -  PublicMethod
- (void)configureViews {
    [self configureTimeView];
}

- (void)configureTimeView {
    self.timeView = [TimeView create];
    [self.topView addSubview:self.timeView];
    [self.timeView setRightSpace:5];
    [self.timeView setTopSpace:5];
    [self.timeView setBottomSpace:5];
    [self.timeView setWidthConstant:120];
    [self.timeView updateWithTimeStamp:0];
    [self.view layoutIfNeeded];
}

@end
