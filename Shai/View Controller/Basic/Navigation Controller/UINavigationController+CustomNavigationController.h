//
//  UINavigationController+CustomNavigationController.h
//  ArchitectureProject
//
//  Created by guoshencheng on 6/23/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CustomNavigationController)

- (void)cubeRightPushViewController:(UIViewController *)viewController;
- (void)cubeLeftPopViewController;
- (void)presentPushViewController:(UIViewController *)viewController;
- (void)fadePushViewController:(UIViewController *)viewController;
- (void)fadePopViewController;
- (void)pushViewControllerFromRight:(UIViewController*)viewController;

@end
