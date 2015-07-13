//
//  HomeViewController+LogicalFlow.h
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController (LogicalFlow)

- (NSArray *)getAllStatus;
- (void)saveAllStatusWithStatusTools:(NSArray *)statusTools;
- (void)sendStatusRequest;

@end
