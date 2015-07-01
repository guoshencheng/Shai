//
//  LabelTabView.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "LabelTabView.h"
#import "LabelTabView+Configuration.h"
#import "LabelTabViewCell+Animation.h"

@implementation LabelTabView

#pragma mark - PublicMethod

+ (instancetype)create {
    LabelTabView *labelTabView = [[[NSBundle mainBundle] loadNibNamed:@"LabelTabView" owner:nil options:nil] lastObject];
    labelTabView.translatesAutoresizingMaskIntoConstraints = NO;
    return labelTabView;
}

- (void)updateWithDataSource:(AvatarLabelTabDatasource *)datasource {
    self.avatarLabelTabDatasource = datasource;
    self.labelCollectionView.dataSource = self.avatarLabelTabDatasource;
}

- (void)updateWithCurrentIndex:(NSInteger)currentIndex {
    if (currentIndex != self.avatarLabelTabDatasource.currentAvatarIndex) {
        if (currentIndex != -1) {
            LabelTabViewCell *lastCell = (LabelTabViewCell *)[self.labelCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.avatarLabelTabDatasource.currentAvatarIndex inSection:0]];
            [lastCell animationSlideDown];
        }
        LabelTabViewCell *currentCell = (LabelTabViewCell *)[self.labelCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:currentIndex inSection:0]];
        [currentCell animationSlideUp];
        self.avatarLabelTabDatasource.currentAvatarIndex = currentIndex;
    }
}

#pragma mark - LiveCycle

- (void)awakeFromNib {
    [self configureViews];
}

@end
