//
//  BrowsePicturesViewControllerCell.m
//  Shai
//
//  Created by guoshencheng on 7/6/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BrowsePicturesViewControllerCell.h"
#import "UIScreen+Utility.h"
#import "UIImageView+AFNetworking.h"
#import "CGSizeUtility.h"


#define SCROLL_VIEW_DEFAULT_ZOOM_SCALE 1.0
#define SCROLL_VIEW_MIN_ZOOM_SCALE 0.8
#define SCROLL_VIEW_MAX_ZOOM_SCALE 1.6

@implementation BrowsePicturesViewControllerCell

- (void)awakeFromNib {
    [self configureScrollView];
    [self addTapGesture];
}

- (void)updateWithImageUrl:(NSString *)imageUrl {
    [self recoverToOrigin];
    self.scrollView.userInteractionEnabled = NO;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:imageUrl]];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    [self.imageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        self.image = image;
        [self.imageView setImage:self.image];
        [self updateScrollView];
        self.scrollView.userInteractionEnabled = YES;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        
    }];
}

#pragma mark - Private Methods

- (void)recoverToOrigin {
    self.scrollView.zoomScale = 1;
    self.image = nil;
    self.imageView.image = nil;
    self.imageView.frame = CGRectMake(0, 0, [UIScreen screenWidth], [UIScreen screenHeight]);
}

- (void)configureScrollView {
    self.bounds = [UIScreen bounds];
    [self.scrollView setDelegate:self];
    [self.scrollView.layer setMasksToBounds:NO];
}

- (void)addTapGesture {
    UITapGestureRecognizer *singleTapViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapViewGestureAction:)];
    [self addGestureRecognizer:singleTapViewRecognizer];
    UITapGestureRecognizer *doubleTapViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapViewGestureAction:)];
    doubleTapViewRecognizer.numberOfTapsRequired = 2;
    [singleTapViewRecognizer requireGestureRecognizerToFail:doubleTapViewRecognizer];
    [self addGestureRecognizer:doubleTapViewRecognizer];
}

- (void)updateScrollView {
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.contentSize = self.image.size;
    [self.scrollView setMinimumZoomScale: [self calculatePictureScrollViewMinZoomScale]];
    [self.scrollView setMaximumZoomScale:[self calculatePictureScrollViewMaxZoomScale]];
    [self.scrollView setZoomScale:[self calculatePictureScrollViewDefaultZoomScale]];
    [self centerScrollViewContents];
    
}

#pragma mark UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollViewContents];
}

#pragma mark - Gesture Actions

- (void)singleTapViewGestureAction:(UITapGestureRecognizer *)gesture {
    //[self zoomToDefaultSizeAndBack];
}

- (void)doubleTapViewGestureAction:(UITapGestureRecognizer *)gesture {
    if ([self isImageScaledToMin]) {
        [self scaleToDefaultSize];
    } else {
        [self scaleToMinSize];
    }
}


- (BOOL)isImageScaledToMin {
    return  self.scrollView.zoomScale == [self calculatePictureScrollViewMinZoomScale];
}

- (void)scaleToDefaultSize {
    [self.scrollView setZoomScale:[self calculatePictureScrollViewDefaultZoomScale] animated:YES];
}

- (void)scaleToMaxSize {
    [self.scrollView setZoomScale:[self calculatePictureScrollViewMaxZoomScale] animated:YES];
}

- (void)scaleToMinSize {
    [self.scrollView setZoomScale:[self calculatePictureScrollViewMinZoomScale] animated:YES];
}

- (CGFloat)calculatePictureScrollViewMaxZoomScale {
    CGSize screenSize = [UIScreen bounds].size;
    CGSize imageSize = self.image.size;
    CGFloat maxZoomScale = SCROLL_VIEW_MAX_ZOOM_SCALE;
    if (screenSize.height > imageSize.height * SCROLL_VIEW_MAX_ZOOM_SCALE || screenSize.width > imageSize.width * SCROLL_VIEW_MAX_ZOOM_SCALE) {
        maxZoomScale = [CGSizeUtility scaleOfsize:imageSize toAspectFillSize:screenSize];
    }
    return maxZoomScale;
}

- (CGFloat)calculatePictureScrollViewDefaultZoomScale {
    CGSize imageSize = self.image.size;
    return [CGSizeUtility scaleOfsize:imageSize toAspectFillSize:CGSizeMake([UIScreen screenWidth], [UIScreen screenHeight])];
}

- (CGFloat)calculatePictureScrollViewMinZoomScale {
    CGSize screenSize = [UIScreen bounds].size;
    CGSize imageSize = self.image.size;
    CGFloat minZoomScale = SCROLL_VIEW_MIN_ZOOM_SCALE;
    if (screenSize.height < imageSize.height || screenSize.width < imageSize.width) {
        minZoomScale = [CGSizeUtility scaleOfSize:imageSize toAspectFitSize:screenSize];
    }
    return minZoomScale;
}

- (CGPoint)calculateScrollViewOffset {
    float scaledImageWidth = self.image.size.width * [self calculatePictureScrollViewDefaultZoomScale];
    float scaledImageHeight = self.image.size.height * [self calculatePictureScrollViewDefaultZoomScale];
    float screenHeight = [UIScreen bounds].size.height;
    float screenWidth = [UIScreen bounds].size.width;
    float offsetXValue = 0;
    float offsetYValue = 0;
    if ((scaledImageWidth - screenWidth) > 0) {
        offsetXValue = scaledImageWidth - screenWidth;
    }
    if ((scaledImageHeight - screenHeight) > 0) {
        offsetYValue = scaledImageHeight - screenHeight;
    }
    return CGPointMake(offsetXValue / 2, offsetYValue / 2);
}

- (void)centerScrollViewContents {
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    self.imageView.frame = contentsFrame;
}

@end
