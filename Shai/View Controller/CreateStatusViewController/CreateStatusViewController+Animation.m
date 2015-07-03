//
//  CreateStatusViewController+Animation.m
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "CreateStatusViewController+Animation.h"

@implementation CreateStatusViewController (Animation)

- (void)animationComeToEditing {
    [UIView animateWithDuration:0.2 animations:^{
        self.topViewTopConstraint.constant = -65;
        self.statusTextViewConstraint.constant = 300;
        [self.view layoutIfNeeded];
    }];
}

- (void)animationEndEditing {
    [UIView animateWithDuration:0.2 animations:^{
        self.topViewTopConstraint.constant = 15;
        self.statusTextViewConstraint.constant = 220;
        [self.view layoutIfNeeded];
    }];
}

@end
