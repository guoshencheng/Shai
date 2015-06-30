//
//  StatusCollectionViewDatasource.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "StatusCollectionViewDatasource.h"
#import "StatusCollectionViewCell.h"

@implementation StatusCollectionViewDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.status.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StatusCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:STATUS_COLLECTION_VIEW_CELL forIndexPath:indexPath];
    StatusTool *statusTool = [self.status objectAtIndex:indexPath.row];
    [cell updateWithStatusTool:statusTool];
    return cell;
}

@end
