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
#import "UIImage+StackBlur.h"
#import "BlurImagePanelView+Animation.h"

@implementation BlurImagePanelView

+ (id)create {
  BlurImagePanelView *view = [[[NSBundle mainBundle] loadNibNamed:@"BlurImagePanelView" owner:nil options:nil] lastObject];
  view.translatesAutoresizingMaskIntoConstraints = NO;
  return view;
}

#pragma mark UIView Lifecycle

- (void)awakeFromNib {
    self.queue = [[NSOperationQueue alloc] init];
  [self configureView];
}

#pragma mark Public Methods

- (void)updateImageWithImage:(UIImage *)image {
    if (image) {
        [self.queue cancelAllOperations];
        [self performSelector:@selector(asyncDisplayImageWithImage:) withObject:image afterDelay:0.5];
    }
}

- (void)cancelUpdate {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(asyncDisplayImageWithImage:) object:nil];
    [self.queue cancelAllOperations];
}

- (void)asyncDisplayImageWithImage:(UIImage *)image {
    NSBlockOperation *operation = [NSBlockOperation new];
    [operation addExecutionBlock:^{
        UIImage *blurImage = [[image normalize] stackBlur:20];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self animateShowBlurImage:blurImage];
        });
    }];
    [self.queue addOperation:operation];
}

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
