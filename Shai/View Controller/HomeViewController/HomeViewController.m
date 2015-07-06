//
//  HomeViewController.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewController+Configuration.h"
#import "HomeViewController+Animation.h"

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
    NSLog(@"%f", round([[NSDate date] timeIntervalSince1970] * 1000));
    NSInteger time = round([[NSDate date] timeIntervalSince1970] * 1000);
    CGFloat referTime = round([[NSDate date] timeIntervalSince1970] * 1000);
    NSDate *date =  [NSDate dateWithTimeIntervalSince1970:referTime / 1000];
}

- (IBAction)didClickLeftButton:(id)sender {
    if (self.containerViewLeftConstraint.constant == 0) {
        [self animationSlideToShowProfilePanel];
    } else {
        [self animationSlideToHideProfilePanel];
    }
}

@end
