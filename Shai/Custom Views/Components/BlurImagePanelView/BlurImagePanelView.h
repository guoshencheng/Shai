//
//  BlurImagePanelView.h
//  Vibin
//
//  Created by Sherlock on 4/3/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import "AutoLayoutView.h"

@interface BlurImagePanelView : AutoLayoutView

@property (weak, nonatomic) IBOutlet UIImageView *bufferImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blurImageView;

@property (strong, nonatomic) NSString *imageUrl;

- (void)updateImageWithUrl:(NSString *)imageUrl;

@end