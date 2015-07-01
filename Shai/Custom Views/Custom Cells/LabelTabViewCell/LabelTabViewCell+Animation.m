//
//  LabelTabViewCell+Animation.m
//  Shai
//
//  Created by guoshencheng on 7/1/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "LabelTabViewCell+Animation.h"

@implementation LabelTabViewCell (Animation)

- (void)animationSlideUp {
    [UIView animateWithDuration:0.2 animations:^{
        self.containerViewTopConstraint.constant = 5;
        [self layoutIfNeeded];
    }];
}

- (void)animationSlideDown {
    [UIView animateWithDuration:0.2 animations:^{
        self.containerViewTopConstraint.constant = self.avatarImageView.frame.size.width;
        [self layoutIfNeeded];
    }];
}

@end
