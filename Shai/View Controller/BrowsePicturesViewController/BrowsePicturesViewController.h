//
//  BrowsePicturesViewController.h
//  Shai
//
//  Created by guoshencheng on 7/6/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"
#import "BrowsePicturesViewControllerDatasource.h"

@interface BrowsePicturesViewController : BaseViewController<UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *pictureCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (strong, nonatomic) NSArray *pictures;
@property (strong, nonatomic) BrowsePicturesViewControllerDatasource *browsePicturesViewControllerDatasource;

@end
