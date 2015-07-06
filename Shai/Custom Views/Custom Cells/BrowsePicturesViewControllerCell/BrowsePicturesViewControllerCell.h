//
//  BrowsePicturesViewControllerCell.h
//  Shai
//
//  Created by guoshencheng on 7/6/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BROWSE_PICTURE_CELL @"BrowsePicturesViewControllerCell"

@interface BrowsePicturesViewControllerCell : UICollectionViewCell <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) UIImage *image;

- (void)updateWithImageUrl:(NSString *)imageUrl;

@end
