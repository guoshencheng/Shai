//
//  BaseViewController.h
//  ArchitectureProject
//
//  Created by guoshencheng on 6/18/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface BaseViewController : UIViewController

+ (instancetype)create;

- (void)toast:(NSString *)message complete:(MBProgressHUDCompletionBlock)complete;
- (void)addAutoDismissKeyboardGesture;

@end
