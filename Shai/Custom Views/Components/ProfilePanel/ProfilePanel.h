//
//  ProfilePanel.h
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "AutoLayoutView.h"

@protocol ProfilePanelDelegate;

@interface ProfilePanel : AutoLayoutView
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *myStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *allStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *createStatusLabel;

@property (nonatomic, strong) id<ProfilePanelDelegate>delegate;

@end

@protocol ProfilePanelDelegate <NSObject>
@optional
- (void)profilePanelDidClickAllStatus:(ProfilePanel *)profilePanel;
- (void)profilePanelDidClickMyStatus:(ProfilePanel *)profilePanel;
- (void)profilePanelDidClickCreateStatus:(ProfilePanel *)profilePanel;

@end