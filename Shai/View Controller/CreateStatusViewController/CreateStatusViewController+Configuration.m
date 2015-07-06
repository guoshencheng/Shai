//
//  CreateStatusViewController+Configuration.m
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "CreateStatusViewController+Configuration.h"
#import <MobileCoreServices/MobileCoreServices.h> 
#import "PictureImageCollectionViewCell.h"

@implementation CreateStatusViewController (Configuration)

- (void)configureBaiDuMapLocationServer {
    [BMKLocationService setLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    [BMKLocationService setLocationDistanceFilter:100.f];
    self.locationService = [[BMKLocationService alloc]init];
    self.locationService.delegate = self;
    [self.locationService startUserLocationService];
}

- (void)configureViews {
    [self configureStatusTextView];
    [self configureCollectionView];
    [self addGestures];
    [self configureImagePicker];
}

#pragma mark - PrivateMethod

- (void)configureStatusTextView {
    self.statusTextView.delegate = self;
}

- (void)configureImagePicker {
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.allowsEditing = NO;
    self.picker.delegate = self;
}

- (void)configureCollectionView {
    self.pictureImageCollectionView.delegate = self;
    self.pictureImageCollectionViewDatasource = [PictureImageCollectionViewDatasource new];
    self.pictureImageCollectionViewDatasource.pictures = [[NSMutableArray alloc] init];
    self.pictureImageCollectionView.dataSource = self.pictureImageCollectionViewDatasource;
    [self.pictureImageCollectionView registerNib:[UINib nibWithNibName:@"PictureImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:PICTURE_IMAGE_COLLECTIONVIEW_CELL];
}

- (void)addGestures {
    [self addAutoDismissKeyboardGesture];
    UITapGestureRecognizer *tapCameraImageView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickCameraImageView:)];
    [self.cameraImageView addGestureRecognizer:tapCameraImageView];
    UITapGestureRecognizer *tapPictureImageView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickPictureImageView:)];
    [self.pictureImageView addGestureRecognizer:tapPictureImageView];
}

- (void)didClickCameraImageView:(UITapGestureRecognizer *)sender {
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        return;
    }
    [self presentViewController:self.picker animated:YES completion:nil];
}

- (void)didClickPictureImageView:(UITapGestureRecognizer *)sender {
    self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.picker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeImage];
    [self presentViewController:self.picker animated:YES completion:nil];
}

@end
