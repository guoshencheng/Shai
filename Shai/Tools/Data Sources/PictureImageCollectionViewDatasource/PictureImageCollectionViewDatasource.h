//
//  PictureImageCollectionViewDatasource.h
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureImageCollectionViewDatasource : NSObject <UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *pictures;
- (void)addPicture:(UIImage *)image;

@end
