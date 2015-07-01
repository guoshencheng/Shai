//
//  LabelTabViewCell.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "LabelTabViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation LabelTabViewCell

- (void)awakeFromNib {
    self.avatarImageView.layer.cornerRadius = 5;
    self.containerViewTopConstraint.constant = self.avatarImageView.frame.size.width;
    [self layoutIfNeeded];
}

- (void)updateWithAvatarUrl:(NSString *)avatarUrl {
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:avatarUrl]];
    [self layoutIfNeeded];
}

@end
