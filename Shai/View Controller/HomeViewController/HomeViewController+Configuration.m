//
//  HomeViewController+Configuration.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+Configuration.h"
#import "BrowsePicturesViewController.h"
#import "StatusCollectionViewCell.h"
#import "AvatarLabelTabDatasource.h"
#import "UIScreen+Utility.h"
#import "HomeViewController+LogicalFlow.h"

@implementation HomeViewController (Configuration)

#pragma mark -  PublicMethod

- (void)reloadData {
    self.avatarLabelTabDataSource.currentAvatarIndex = -1;
    [self.avatarLabelTabDataSource setAvatarUrlsFromStatus:self.status];
    [self.labelTabView updateWithDataSource:self.avatarLabelTabDataSource];
    [self.labelTabView updateWithCurrentIndex:0];
    self.statusCollectionViewDatasource.status = self.status;
    self.statusCollectionView.dataSource = self.statusCollectionViewDatasource;
    [self.statusCollectionView reloadData];
    if (self.status.count > 0) {
        StatusTool *firstStatusTool = [self.status objectAtIndex:0];
        [self.timeView updateWithDate:firstStatusTool.sendDate];
    }
    [self.view layoutIfNeeded];
}

- (void)configureViews {
    self.currentIndex = 0;
    [self initSatatus];
    [self configureTimeView];
    [self configureStatausCollectionView];
    [self configureAvatarLabelView];
    [self configureProfilePanel];
    [self configureBlurImageBackgroundPanel];
    [self.view layoutIfNeeded];
}

#pragma mark - PrivateMethod

- (void)initSatatus {
    self.status = [[NSArray alloc] init];
    self.status = [self getAllStatus];
}

- (void)configureAvatarLabelView {
    self.labelTabView = [LabelTabView create];
    [self.containerView addSubview:self.labelTabView];
    [self.labelTabView setRightSpace:0];
    [self.labelTabView setLeftSpace:0];
    [self.labelTabView setBottomSpace:0];
    [self.labelTabView setHeightConstant:58];
    self.avatarLabelTabDataSource = [AvatarLabelTabDatasource new];
    self.avatarLabelTabDataSource.currentAvatarIndex = -1;
    [self.avatarLabelTabDataSource setAvatarUrlsFromStatus:self.status];
    [self.labelTabView updateWithDataSource:self.avatarLabelTabDataSource];
}

- (void)configureStatausCollectionView {
    self.statusCollectionView.delegate = self;
    self.statusCollectionViewDatasource = [StatusCollectionViewDatasource new];
    self.statusCollectionViewDatasource.status = self.status;
    __weak typeof(self) weakSelf = self;
    self.statusCollectionViewDatasource.configureStatusCellBlock = ^(UICollectionViewCell *cell) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(didClickPosterImageView:)];
        StatusCollectionViewCell *statusCell = (StatusCollectionViewCell *)cell;
        [statusCell posterImageViewAddStatusGesture:tap];
        statusCell.delegate = weakSelf;
    };
    [self.statusCollectionView registerNib:[UINib nibWithNibName:@"StatusCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:STATUS_COLLECTION_VIEW_CELL];
    self.statusCollectionView.dataSource = self.statusCollectionViewDatasource;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.statusCollectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake([UIScreen screenWidth], [UIScreen screenHeight] - 80 - 58);
}

- (void)configureBlurImageBackgroundPanel { // for show
    self.blurImageBackgroundView = [BlurImagePanelView create];
    [self.view addSubview:self.blurImageBackgroundView];
    [self.view sendSubviewToBack:self.blurImageBackgroundView];
    [self.blurImageBackgroundView setLeftSpace:0];
    [self.blurImageBackgroundView setTopSpace:0];
    [self.blurImageBackgroundView setRightSpace:0];
    [self.blurImageBackgroundView setBottomSpace:0];
}


- (void)configureProfilePanel {
    self.profilePanel = [ProfilePanel create];
    [self.view insertSubview:self.profilePanel belowSubview:self.containerView];
    [self.profilePanel setWidthConstant:[UIScreen screenWidth] - 30];
    [self.profilePanel setLeftSpace: - ([UIScreen screenWidth] - 30)];
    [self.profilePanel setTopSpace:0];
    [self.profilePanel setBottomSpace:0];
    self.profilePanel.delegate = self;
}

- (void)configureTimeView {
    self.timeView = [TimeView create];
    [self.topView addSubview:self.timeView];
    [self.timeView setRightSpace:-10];
    [self.timeView setTopSpace:5];
    [self.timeView setBottomSpace:5];
    [self.timeView setWidthConstant:120];
    if (self.status.count > 0) {
        StatusTool *firstStatusTool = [[self getTestStatus] objectAtIndex:0];
        [self.timeView updateWithDate:firstStatusTool.sendDate];
    }
}

- (void)didClickPosterImageView:(UITapGestureRecognizer *)gesture {
    StatusTool *statusTool = [self.status objectAtIndex:gesture.view.tag];
    BrowsePicturesViewController *viewController = [BrowsePicturesViewController create];
    viewController.pictures = statusTool.posterImageUrls;
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - TESTDATA 

- (NSArray *)getTestStatus {
    return @[[self getTestStatusTool],[self getTestStatusTool],[self getTestStatusTool],[self getTestStatusTool]];
}

- (StatusTool *)getTestStatusTool {
    return [StatusTool createWithNickName:@"贰浅不可能这么贰吧" selfDecription:@"微博登入按钮主要是简化用户进行 SSO 登陆，实际上，它内部是对 SSO 认证流程进行了简单的封装。微博登出按钮主要提供一键登出的功能，帮助开发者主动取消用户的授权。" location:@"地点:浙江杭州" posterImage:[self getTestPosterImageUrls] sendDate:[NSDate date] avatarUrl:@"http://cdnq.duitang.com/uploads/item/201408/28/20140828224832_JdeHi.jpeg" userId:1 statusId:1];
}

- (NSArray *)getTestPosterImageUrls {
    return @[@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg", @"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg", @"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
}

@end
