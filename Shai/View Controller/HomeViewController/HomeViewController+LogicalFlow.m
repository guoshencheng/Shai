//
//  HomeViewController+LogicalFlow.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+LogicalFlow.h"
#import "HomeViewController+Configuration.h"

@implementation HomeViewController (LogicalFlow)

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
    self.status = [response statusToolsObjectFactory];
    [self reloadData];
}

@end
