//
//  HomeViewController+Configuration.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+Configuration.h"
#import "StatusCollectionViewCell.h"
#import "AvatarLabelTabDatasource.h"

@implementation HomeViewController (Configuration)

#pragma mark -  PublicMethod
- (void)configureViews {
    [self configureTimeView];
    [self configureStatausCollectionView];
    [self configureAvatarLabelView];
}

#pragma mark - PrivateMethod

- (void)configureAvatarLabelView {
    self.labelTabView = [LabelTabView create];
    [self.containerView addSubview:self.labelTabView];
    [self.labelTabView setRightSpace:0];
    [self.labelTabView setLeftSpace:0];
    [self.labelTabView setBottomSpace:0];
    [self.labelTabView setHeightConstant:58];
    AvatarLabelTabDatasource *dataSource = [AvatarLabelTabDatasource new];
    dataSource.currentAvatarIndex = -1;
    [dataSource setAvatarUrlsFromStatus:[self getTestStatus]];
    [self.labelTabView updateWithDataSource:dataSource];
}

- (void)configureStatausCollectionView {
    self.statusCollectionView.delegate = self;
    self.statusCollectionViewDatasource = [StatusCollectionViewDatasource new];
    self.statusCollectionViewDatasource.status = [self getTestStatus];
    [self.statusCollectionView registerNib:[UINib nibWithNibName:@"StatusCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:STATUS_COLLECTION_VIEW_CELL];
    self.statusCollectionView.dataSource = self.statusCollectionViewDatasource;
}

- (void)configureTimeView {
    self.timeView = [TimeView create];
    [self.topView addSubview:self.timeView];
    [self.timeView setRightSpace:-10];
    [self.timeView setTopSpace:5];
    [self.timeView setBottomSpace:5];
    [self.timeView setWidthConstant:120];
    StatusTool *firstStatusTool = [[self getTestStatus] objectAtIndex:0];
    [self.timeView updateWithDate:firstStatusTool.sendDate];
    [self.view layoutIfNeeded];
}

#pragma mark - TESTDATA 

- (NSArray *)getTestStatus {
    return @[[self getTestStatusTool],[self getTestStatusTool],[self getTestStatusTool],[self getTestStatusTool]];
}

- (StatusTool *)getTestStatusTool {
    return [StatusTool createWithNickName:@"贰浅不可能这么贰吧" selfDecription:@"微博登入按钮主要是简化用户进行 SSO 登陆，实际上，它内部是对 SSO 认证流程进行了简单的封装。微博登出按钮主要提供一键登出的功能，帮助开发者主动取消用户的授权。" location:@"地点:浙江杭州" posterImage:[self getTestPosterImageUrls] sendDate:[NSDate date] avatarUrl:@"http://cdnq.duitang.com/uploads/item/201408/28/20140828224832_JdeHi.jpeg"];
}

- (NSArray *)getTestPosterImageUrls {
    return @[@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg", @"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg", @"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
}

@end
