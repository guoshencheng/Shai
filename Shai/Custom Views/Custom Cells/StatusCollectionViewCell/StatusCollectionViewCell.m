//
//  StatusCollectionViewCell.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "StatusCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation StatusCollectionViewCell

- (void)awakeFromNib {
    self.containerView.layer.cornerRadius = 10.0;
    [self.locationImageView setImage:[UIImage imageNamed:@"status_collectionview_cell_location_icon"]];
}

- (void)updateWithStatusTool:(StatusTool *)statusTool {
    [self updateWithNickName:statusTool.nickName posterImageUrl:[statusTool.posterImageUrls objectAtIndex:0] description:statusTool.details location:statusTool.location];
}

- (void)updateWithNickName:(NSString *)nickName posterImageUrl:(NSString *)posterImageUrl description:(NSString *)description location:(NSString *)location {
    self.nickNameLabel.text = nickName;
    if (posterImageUrl) {
        [self.posterImageView setImageWithURL:[NSURL URLWithString:posterImageUrl]];
    } else {
        self.posterImageViewRightConstraint.constant = self.containerView.frame.size.width;
    }
    self.descriptionLabel.text = description;
    if (location) {
        self.locationLabel.text = location;
    } else {
        self.locationLabel.text = @"";
        self.locationImageView.hidden = YES;
    }
    [self layoutIfNeeded];
}

@end
