//
//  BrowsePicturesViewControllerDatasource.m
//  Shai
//
//  Created by guoshencheng on 7/6/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BrowsePicturesViewControllerDatasource.h"
#import "BrowsePicturesViewControllerCell.h"
#import "UIScreen+Utility.h"

@implementation BrowsePicturesViewControllerDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.pictures.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BrowsePicturesViewControllerCell *browsePicturesViewControllerCell = [collectionView dequeueReusableCellWithReuseIdentifier:BROWSE_PICTURE_CELL forIndexPath:indexPath];
    NSString *imageUrl = [self.pictures objectAtIndex:indexPath.item];
    [browsePicturesViewControllerCell updateWithImageUrl:imageUrl];
    return browsePicturesViewControllerCell;
}

@end
