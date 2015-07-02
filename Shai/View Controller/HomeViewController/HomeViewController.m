//
//  HomeViewController.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewController+Configuration.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark - PublicMethod

+ (instancetype)create {
    return [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
}

#pragma mark - LiveCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}

- (void)viewDidAppear:(BOOL)animated {
}

@end
