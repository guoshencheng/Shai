//
//  BlurImagePanelView+Animation.m
//  Vibin
//
//  Created by Sherlock on 4/3/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import "BlurImagePanelView+Animation.h"

@implementation BlurImagePanelView (Animation)

- (void)animateShowBlurImage:(UIImage *)blurImage {
  [UIView animateWithDuration:0.2 animations:^{
    self.blurImageView.alpha = 0.2;
  } completion:^(BOOL finished) {
    self.blurImageView.image = blurImage;
    [UIView animateWithDuration:0.2 animations:^{
      self.blurImageView.alpha = 1.0;
    }];
  }];
}

@end
