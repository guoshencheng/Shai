//
//  BlurImagePanelView+Configuration.m
//  Vibin
//
//  Created by Sherlock on 4/3/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import "BlurImagePanelView+Configuration.h"
#import "BlurImagePanelView+Animation.h"
#import "UIImageView+WebCache.h"
#import "UIImage+StackBlur.h"
#import "UIScreen+Utility.h"

@implementation BlurImagePanelView (Configuration)

#pragma mark - Public Methods

- (void)configureView {
  [self addGradientMask];
}

- (void)updateBlurImage {
  typeof(self) __weak weakSelf = self;
    [self.bufferImageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!error) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                UIImage *blurImage = [[image normalize] stackBlur:20];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf animateShowBlurImage:blurImage];
                });
            });
        }
    }];
}

#pragma mark - Private Methods

- (void)addGradientMask {
  CAGradientLayer *gradientLayer = [CAGradientLayer layer];
  gradientLayer.frame = [UIScreen bounds];
  gradientLayer.colors =  @[(id)[[UIColor colorWithWhite:0.f alpha:0.5f] CGColor], (id)[[UIColor colorWithWhite:0.f alpha:0.1f] CGColor], (id)[[UIColor colorWithWhite:0.f alpha:0.5f] CGColor]];
  gradientLayer.locations = @[@0.0, @0.5, @1.0];
  gradientLayer.startPoint = CGPointMake(0.5f, 0.0f);
  gradientLayer.endPoint = CGPointMake(0.5f, 1.0f);
  [self.blurImageView.layer insertSublayer:gradientLayer atIndex:0];
}

@end
