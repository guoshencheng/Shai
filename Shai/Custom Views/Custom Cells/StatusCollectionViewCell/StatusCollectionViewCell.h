//
//  StatusCollectionViewCell.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusTool.h"

#define STATUS_COLLECTION_VIEW_CELL @"StatusCollectionViewCell"

@interface StatusCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *posterImageViewRightConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *locationImageView;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

- (void)updateWithStatusTool:(StatusTool *)statusTool;
- (void)updateWithNickName:(NSString *)nickName posterImageUrl:(NSString *)posterImageUrl description:(NSString *)description location:(NSString *)location;

@end
