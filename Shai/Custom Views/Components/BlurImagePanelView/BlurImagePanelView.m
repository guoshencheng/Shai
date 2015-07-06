//
//  BlurImagePanelView.m
//  Vibin
//
//  Created by Sherlock on 4/3/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import "BlurImagePanelView.h"
#import "BlurImagePanelView+Configuration.h"
#import "UIImageView+WebCache.h"

@implementation BlurImagePanelView

+ (id)create {
  BlurImagePanelView *view = [[[NSBundle mainBundle] loadNibNamed:@"BlurImagePanelView" owner:nil options:nil] lastObject];
  view.translatesAutoresizingMaskIntoConstraints = NO;
  return view;
}

#pragma mark UIView Lifecycle

- (void)awakeFromNib {
  [self configureView];
}

#pragma mark Public Methods

- (void)updateImageWithUrl:(NSString *)imageUrl {
  if (0 == imageUrl.length) {
    self.imageUrl = nil;
    self.blurImageView.image = nil;
    [self.bufferImageView setImageWithURL:nil];
    return;
  }
  if ([imageUrl isEqualToString:self.imageUrl]) {
    return;
  }
  self.imageUrl = imageUrl;
  [self updateBlurImage];
}

@end
