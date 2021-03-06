//
//  CreateStatusViewController.h
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"
#import <BaiduMapAPI/BMapKit.h>
#import <BaiduMapAPI/BMKLocationService.h>
#import "ApiService.h"
#import "PictureImageCollectionViewDatasource.h"

@protocol CreateStatusViewControllerDelegate;

@interface CreateStatusViewController : BaseViewController <UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, ApiServiceDelegate, BMKLocationServiceDelegate>

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITextView *statusTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *cameraImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *statusTextViewConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *pictureImageCollectionView;

@property (weak, nonatomic) id<CreateStatusViewControllerDelegate> delegate;

@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) PictureImageCollectionViewDatasource *pictureImageCollectionViewDatasource;
@property (strong, nonatomic) BMKLocationService *locationService;

- (NSString *)getLocationString;

@end

@protocol CreateStatusViewControllerDelegate <NSObject>
@optional
- (void)createStatusViewControllerDidCreateNewStatus:(CreateStatusViewController *)createStatusViewController;

@end