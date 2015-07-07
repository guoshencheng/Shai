//
//  LabelTabViewCell.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LABEL_TAB_VIEW_CELL @"LabelTabViewCell"

@interface LabelTabViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewTopConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

- (void)updateWithAvatarUrl:(NSString *)avatarUrl;
- (void)riseUp;

@end
