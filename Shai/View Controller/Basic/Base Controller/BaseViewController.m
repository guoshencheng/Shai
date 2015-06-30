//
//  BaseViewController.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/18/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

+ (instancetype)create {
    NSAssert(false, @"-base view controller should never be created without subclass");
    return nil;
}

#pragma mark Public Methods

- (void)toast:(NSString *)message complete:(MBProgressHUDCompletionBlock)complete {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.labelFont = [UIFont fontWithName:@"HelveticaNeue" size:12];
    hud.margin = 14.f;
    hud.userInteractionEnabled = NO;
    hud.removeFromSuperViewOnHide = YES;
    hud.completionBlock = complete;
    hud.yOffset = 0;
    [hud hide:YES afterDelay:1.3];
}

- (void)addAutoDismissKeyboardGesture {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(autoDismissKeyboardGestureAction:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    
    // add Gesture
    [notificationCenter addObserverForName:UIKeyboardWillShowNotification
                                    object:nil
                                     queue:mainQuene
                                usingBlock:^(NSNotification *note){
                                    [self.view addGestureRecognizer:singleTapGesture];
                                }];
    
    // remove Gesture
    [notificationCenter addObserverForName:UIKeyboardWillHideNotification
                                    object:nil
                                     queue:mainQuene
                                usingBlock:^(NSNotification *note){
                                    [self.view removeGestureRecognizer:singleTapGesture];
                                }];
}

#pragma mark Private Methods

- (void)autoDismissKeyboardGestureAction:(UIGestureRecognizer *)gestureRecognizer {
    [self.view endEditing:YES];
}

@end
