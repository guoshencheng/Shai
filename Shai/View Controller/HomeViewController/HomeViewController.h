//
//  HomeViewController.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"
#import "CreateStatusViewController.h"
#import "TimeView.h"
#import "LabelTabView.h"
#import "StatusCollectionViewDatasource.h"
#import "ApiService.h"
#import "ProfilePanel.h"
#import "BlurImagePanelView.h"

@interface HomeViewController : BaseViewController <UICollectionViewDelegate, ApiServiceDelegate, ProfilePanelDelegate, CreateStatusViewControllerDelegate, StatusCollectionViewCellDelegate>

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIImageView *leftButtonImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *statusCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewRightConstraint;
@property (assign, nonatomic) NSInteger currentIndex;
@property (strong, nonatomic) NSArray *status;
@property (strong, nonatomic) ProfilePanel *profilePanel;
@property (strong, nonatomic) TimeView *timeView;
@property (strong, nonatomic) LabelTabView *labelTabView;
@property (strong, nonatomic) BlurImagePanelView *blurImageBackgroundView;
@property (strong, nonatomic) StatusCollectionViewDatasource *statusCollectionViewDatasource;
@property (strong, nonatomic) AvatarLabelTabDatasource *avatarLabelTabDataSource;

+ (instancetype)create;

@end
