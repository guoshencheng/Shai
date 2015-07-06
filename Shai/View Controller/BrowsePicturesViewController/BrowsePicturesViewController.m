//
//  BrowsePicturesViewController.m
//  Shai
//
//  Created by guoshencheng on 7/6/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BrowsePicturesViewController.h"
#import "BrowsePicturesViewControllerCell.h"
#import "UIScreen+Utility.h"

@interface BrowsePicturesViewController ()

@end

@implementation BrowsePicturesViewController

+ (instancetype)create {
    return [[BrowsePicturesViewController alloc] initWithNibName:@"BrowsePicturesViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureCollectionView];
    [self configureBackImageView];
}

#pragma mark - PrivateMethod

- (void)configureCollectionView {
    self.browsePicturesViewControllerDatasource = [BrowsePicturesViewControllerDatasource new];
    self.browsePicturesViewControllerDatasource.pictures = self.pictures;
    self.pictureCollectionView.dataSource = self.browsePicturesViewControllerDatasource;
    self.pictureCollectionView.delegate = self;
    [self.pictureCollectionView registerNib:[UINib nibWithNibName:@"BrowsePicturesViewControllerCell" bundle:nil] forCellWithReuseIdentifier:BROWSE_PICTURE_CELL];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.pictureCollectionView.collectionViewLayout;
    layout.itemSize = [UIScreen screenSize];
}

- (void)configureBackImageView {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchBackImageView:)];
    [self.backImageView addGestureRecognizer:tap];
}

#pragma mark - UICollectionViewDelegate



#pragma mark - Action 

- (void)didTouchBackImageView:(UITapGestureRecognizer *)gesture {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
