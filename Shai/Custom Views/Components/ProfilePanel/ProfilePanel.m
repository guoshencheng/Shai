//
//  ProfilePanel.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "ProfilePanel.h"
#import "ProfilePanel+Configuration.h"

@implementation ProfilePanel

+ (instancetype)create {
    ProfilePanel *profilePanel = [[[NSBundle mainBundle] loadNibNamed:@"ProfilePanel" owner:nil options:nil] lastObject];
    profilePanel.translatesAutoresizingMaskIntoConstraints = NO;
    return profilePanel;
}

- (void)awakeFromNib {
    [self configureViews];
}

@end
