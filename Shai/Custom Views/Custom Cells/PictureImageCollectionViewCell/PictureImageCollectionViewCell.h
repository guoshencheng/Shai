//
//  PictureImageCollectionViewCell.h
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define PICTURE_IMAGE_COLLECTIONVIEW_CELL @"PictureImageCollectionViewCell"

@interface PictureImageCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
- (void)updateWithImage:(UIImage *)image;

@end
