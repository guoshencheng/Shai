//
//  HomeViewController.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"
#import "TimeView.h"

@interface HomeViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIImageView *leftButtonImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *statusCollectionView;

@property (strong, nonatomic) TimeView *timeView;

+ (instancetype)create;

@end
