//
//  LabelTabView+Configuration.m
//  Shai
//
//  Created by guoshencheng on 7/1/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "LabelTabView+Configuration.h"
#import "LabelTabViewCell.h"

@implementation LabelTabView (Configuration)

#pragma mark - PublicMethod

- (void)configureViews {
    [self configureCollectionView];
}

#pragma mark - PrivateMethod 

- (void)configureCollectionView {
    self.labelCollectionView.delegate = self;
    [self.labelCollectionView registerNib:[UINib nibWithNibName:@"LabelTabViewCell" bundle:nil] forCellWithReuseIdentifier:LABEL_TAB_VIEW_CELL];
}

@end
