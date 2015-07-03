//
//  CreateStatusViewController.m
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "CreateStatusViewController.h"
#import "CreateStatusViewController+Animation.h"
#import "CreateStatusViewController+Configuration.h"
#import "ApiService.h"
#import "Owener+DataManager.h"

@interface CreateStatusViewController ()

@end

@implementation CreateStatusViewController

+ (instancetype)create {
    return [[CreateStatusViewController alloc] initWithNibName:@"CreateStatusViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}

- (IBAction)didClickBackButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)didClickSaveButton:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    Owener *owner = [Owener getOwenserInfomation];
    [[ApiService serviceWithDelegate:self] sendJSONRequest:[ApiRequest requestForUploadPictureWithUserId:[owner.userId stringValue] andImage:[self.pictureImageCollectionViewDatasource.pictures objectAtIndex:0]]];
}


- (void)textViewDidBeginEditing:(UITextView *)textView {
    [self animationComeToEditing];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self animationEndEditing];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.pictureImageCollectionViewDatasource addPicture:[info objectForKey:UIImagePickerControllerOriginalImage]];
    [self.pictureImageCollectionView reloadData];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
