//
//  AppDelegate.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "AppDelegate.h"
#import "UIScreen+Utility.h"
#import "MagicalRecordWorkaround.h"
#import "CoreData+MagicalRecord.h"
#import "DemoOneViewController.h"
#import <BaiduMapAPI/BMapKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate {
    BMKMapManager *_mapManager;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initCoreDataWithMagicalRecord];
    
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"nEPFYLUqniyi1uRR4CVe4ZvB"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    [self iniWindow];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

#pragma mark - PrivateMethod

- (void)initCoreDataWithMagicalRecord {
    [MagicalRecord setShouldAutoCreateManagedObjectModel:NO];
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"Shai" withExtension:@"momd"];
    NSManagedObjectModel *objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelUrl];
    [NSManagedObjectModel MR_setDefaultManagedObjectModel:objectModel];
    [MagicalRecord setShouldDeleteStoreOnModelMismatch:YES];
    [MagicalRecordWorkaround setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"Shai.sqlite"];
}


- (void)iniWindow {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen bounds]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[DemoOneViewController create]];
    navigationController.navigationBarHidden = YES;
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
}

@end
