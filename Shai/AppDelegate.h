//
//  AppDelegate.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "WeiboSDK.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, WeiboSDKDelegate, WBHttpRequestDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

