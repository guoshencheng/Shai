//
//  AppDelegate.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ThirdPartyTool.h"
#import "ApiService.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, ApiServiceDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;

@end

