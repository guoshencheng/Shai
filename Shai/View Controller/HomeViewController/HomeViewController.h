//
//  HomeViewController.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"
#import "TimeView.h"
#import "LabelTabView.h"
#import "StatusCollectionViewDatasource.h"

@interface HomeViewController : BaseViewController <UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIImageView *leftButtonImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *statusCollectionView;

@property (strong, nonatomic) TimeView *timeView;
@property (strong, nonatomic) LabelTabView *labelTabView;
@property (strong, nonatomic) StatusCollectionViewDatasource *statusCollectionViewDatasource;

+ (instancetype)create;

@end
