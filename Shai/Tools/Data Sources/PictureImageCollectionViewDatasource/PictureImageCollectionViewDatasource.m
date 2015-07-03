//
//  PictureImageCollectionViewDatasource.m
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "PictureImageCollectionViewDatasource.h"
#import "PictureImageCollectionViewCell.h"

@implementation PictureImageCollectionViewDatasource

- (void)addPicture:(UIImage *)image {
    [self.pictures addObject:image];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.pictures.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PictureImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PICTURE_IMAGE_COLLECTIONVIEW_CELL forIndexPath:indexPath];
    [cell updateWithImage:[self.pictures objectAtIndex:indexPath.item]];
    return cell;
}

@end
