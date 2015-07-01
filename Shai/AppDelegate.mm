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
#import "LoginViewController.h"
#import "HomeViewController.h"
#import <BaiduMapAPI/BMapKit.h>

#define APPKEY @"1734340436"
#define REDIRECT_URI @"https://api.weibo.com/oauth2/default.html"

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
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:APPKEY];
    
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

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WeiboSDK handleOpenURL:url delegate:self];
}

#pragma mark - WBHttpRequestDelegate

- (void)request:(WBHttpRequest *)request didFinishLoadingWithDataResult:(NSData *)data {
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSString *nickName = [result objectForKey:@"name"];
    NSString *avatar = [result objectForKey:@"profile_image_url"];
    NSString *userId = [result objectForKey:@"id"];
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"weiboAccessToken"];
    [[ApiService serviceWithDelegate:self] sendJSONRequest:[ApiRequest requestForLoginWithUserId:userId nickName:nickName avatarUrl:avatar]];
    NSLog(@"nickName:%@ avatar:%@ accessToken:%@", nickName, avatar, accessToken);
}

#pragma mark - WeiboSDKDelegate

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    WBAuthorizeResponse *authorizeResponse = (WBAuthorizeResponse *)response;
    [WBHttpRequest requestWithAccessToken:authorizeResponse.accessToken url:@"https://api.weibo.com/2/users/show.json" httpMethod:@"GET" params:@{@"uid":authorizeResponse.userID} delegate:self withTag:nil];
    [[NSUserDefaults standardUserDefaults] setObject:authorizeResponse.accessToken forKey:@"weiboAccessToken"];
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
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[LoginViewController create]];
    navigationController.navigationBarHidden = YES;
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
}

@end
