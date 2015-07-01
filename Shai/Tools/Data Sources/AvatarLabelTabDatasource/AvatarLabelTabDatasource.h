//
//  AvatarLabelTabDatasource.h
//  Shai
//
//  Created by guoshencheng on 7/1/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvatarLabelTabDatasource : NSObject <UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *avatarUrls;
@property (nonatomic, assign) NSInteger currentAvatarIndex;

- (void)setAvatarUrlsFromStatus:(NSArray *)statuses;

@end
