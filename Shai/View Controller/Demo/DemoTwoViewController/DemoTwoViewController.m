//
//  DemoTwoViewController.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/23/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "DemoTwoViewController.h"
#import "UINavigationController+CustomNavigationController.h"

@implementation DemoTwoViewController

+ (instancetype)create {
    return [[DemoTwoViewController alloc] initWithNibName:@"DemoTwoViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickBackButton:(id)sender {
    [self.navigationController cubeLeftPopViewController];
}

@end
