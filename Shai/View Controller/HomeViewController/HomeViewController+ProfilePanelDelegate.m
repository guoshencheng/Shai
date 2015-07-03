//
//  HomeViewController+ProfilePanelDelegate.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+ProfilePanelDelegate.h"
#import "HomeViewController+Animation.h"

@implementation HomeViewController (ProfilePanelDelegate)

- (void)profilePanelDidClickAllStatus:(ProfilePanel *)profilePanel {
    [self animationSlideToHideProfilePanel];
}

- (void)profilePanelDidClickCreateStatus:(ProfilePanel *)profilePanel {
    [self animationSlideToHideProfilePanel];
}

- (void)profilePanelDidClickMyStatus:(ProfilePanel *)profilePanel {
    [self animationSlideToHideProfilePanel];
}

@end
