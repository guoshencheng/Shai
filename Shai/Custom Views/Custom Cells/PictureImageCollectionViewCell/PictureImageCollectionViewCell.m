//
//  PictureImageCollectionViewCell.m
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "PictureImageCollectionViewCell.h"

@implementation PictureImageCollectionViewCell

- (void)awakeFromNib {
    self.pictureImageView.layer.cornerRadius = 5;
}

- (void)updateWithImage:(UIImage *)image {
    [self.pictureImageView setImage:image];
}

@end
