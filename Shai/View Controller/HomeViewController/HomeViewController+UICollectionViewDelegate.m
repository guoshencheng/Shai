//
//  HomeViewController+UICollectionViewDelegate.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+UICollectionViewDelegate.h"
#import "StatusTool.h"
#import "LabelTabViewCell+Animation.h"

@implementation HomeViewController (UICollectionViewDelegate)

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    StatusTool *statusTool = [self.statusCollectionViewDatasource.status objectAtIndex:[self caculateCurrentPageWithOffset:scrollView.contentOffset.x]];
    [self.timeView updateWithDate:statusTool.sendDate];
    [self.labelTabView updateWithCurrentIndex:[self caculateCurrentPageWithOffset:scrollView.contentOffset.x]];
}

#pragma mark - PrivateMethod

- (NSInteger)caculateCurrentPageWithOffset:(CGFloat)offset {
    return offset / self.statusCollectionView.frame.size.width;
}

@end
