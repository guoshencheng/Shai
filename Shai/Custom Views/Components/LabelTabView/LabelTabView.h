//
//  LabelTabView.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "AutoLayoutView.h"
#import "AvatarLabelTabDatasource.h"

@interface LabelTabView : AutoLayoutView <UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *labelCollectionView;
@property (strong, nonatomic) AvatarLabelTabDatasource *avatarLabelTabDatasource;
@property (assign, nonatomic) NSInteger currentIndex;

- (void)updateWithDataSource:(AvatarLabelTabDatasource *)datasource;
- (void)updateWithCurrentIndex:(NSInteger)currentIndex;

@end
