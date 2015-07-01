//
//  AvatarLabelTabDatasource.m
//  Shai
//
//  Created by guoshencheng on 7/1/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "AvatarLabelTabDatasource.h"
#import "LabelTabViewCell.h"
#import "StatusTool.h"

@implementation AvatarLabelTabDatasource

#pragma mark - PublicMethod

- (void)setAvatarUrlsFromStatus:(NSArray *)statuses {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < statuses.count; i ++) {
        StatusTool *status = [statuses objectAtIndex:i];
        [array addObject:status.avatarUrl];
    }
    self.avatarUrls = array;
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.avatarUrls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LabelTabViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LABEL_TAB_VIEW_CELL forIndexPath:indexPath];
    [cell updateWithAvatarUrl:[self.avatarUrls objectAtIndex:indexPath.item]];
    return cell;
}

@end
