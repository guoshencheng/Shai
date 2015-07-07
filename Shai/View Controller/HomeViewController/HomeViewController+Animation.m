//
//  HomeViewController+Animation.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+Animation.h"
#import "UIScreen+Utility.h"

@implementation HomeViewController (Animation)

- (void)animationSlideToShowProfilePanel {
    [UIView animateWithDuration:0.2 animations:^{
        [self updateProfilePanelWithOffset:[UIScreen screenWidth] - 30];
    }];
}

- (void)animationSlideToHideProfilePanel {
    [UIView animateWithDuration:0.2 animations:^{
        [self updateProfilePanelWithOffset:0];
    }];
}

#pragma mark - PrivateMethod

- (void)updateProfilePanelWithOffset:(CGFloat)offset {
    [self.profilePanel setLeftSpace:-([UIScreen screenWidth] - 30 ) + offset];
    self.containerViewLeftConstraint.constant = offset;
    self.containerViewRightConstraint.constant = -offset;
    [self.view layoutIfNeeded];
}

@end
