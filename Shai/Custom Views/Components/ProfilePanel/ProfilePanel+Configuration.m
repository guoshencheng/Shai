//
//  ProfilePanel+Configuration.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "ProfilePanel+Configuration.h"
#import "Owener+DataManager.h"
#import "UIImageView+AFNetworking.h"

@implementation ProfilePanel (Configuration)

#pragma mark - PublicMethod

- (void)configureViews {
    [self configureTextAndCornerRadius];
    [self addGestures];
}

#pragma mark - PrivateMethod 

- (void)configureTextAndCornerRadius {
    [self configureImageView];
    Owener *owner = [Owener getOwenserInfomation];
    self.nickNameLabel.text = owner.nickName;
    self.myStatusLabel.text = NSLocalizedString(@"profilepanel-mystatus", nil);
    self.allStatusLabel.text = NSLocalizedString(@"profilepanel-allstatus", nil);
    self.createStatusLabel.text = NSLocalizedString(@"profilepanel-createstatus", nil);
}

- (void)addGestures {
    UITapGestureRecognizer *myStatusTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myStatusLabelTapAction:)];
    [self.myStatusLabel addGestureRecognizer:myStatusTapGesture];
    UITapGestureRecognizer *allStatusTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(allStatusLabelTapAction:)];
    [self.myStatusLabel addGestureRecognizer:allStatusTapGesture];
    UITapGestureRecognizer *createStatusTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(createStatusLabelTapAction:)];
    [self.myStatusLabel addGestureRecognizer:createStatusTapGesture];
}

- (void)configureImageView {
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2;
    self.avatarImageView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.avatarImageView.layer.borderWidth = 2;
    Owener *owner = [Owener getOwenserInfomation];
    if (owner.avatarUrl) {
        [self.avatarImageView setImageWithURL:[NSURL URLWithString:owner.avatarUrl]];
    }
}

- (void)myStatusLabelTapAction:(UITapGestureRecognizer *)sender {
    if ([self.delegate respondsToSelector:@selector(profilePanelDidClickMyStatus:)]) {
        [self.delegate profilePanelDidClickMyStatus:self];
    }
}

- (void)allStatusLabelTapAction:(UITapGestureRecognizer *)sender {
    if ([self.delegate respondsToSelector:@selector(profilePanelDidClickAllStatus:)]) {
        [self.delegate profilePanelDidClickAllStatus:self];
    }
}

- (void)createStatusLabelTapAction:(UITapGestureRecognizer *)sender {
    if ([self.delegate respondsToSelector:@selector(profilePanelDidClickCreateStatus:)]) {
        [self.delegate profilePanelDidClickCreateStatus:self];
    }
}

@end
