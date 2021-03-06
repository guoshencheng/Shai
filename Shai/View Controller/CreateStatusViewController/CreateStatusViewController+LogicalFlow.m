//
//  CreateStatusViewController+LogicalFlow.m
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "CreateStatusViewController+LogicalFlow.h"

@implementation CreateStatusViewController (LogicalFlow)

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
    if ([request.url isEqualToString:IMAGE_URL] && request.method == ApiRequestMethodPost) {
        if ([response success]) {
            [service sendJSONRequest:[ApiRequest requestForCreateStatusWithDetails:self.statusTextView.text location:[self getLocationString] imageUrls:@[[response imageUrlResponseFactory]]]];
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    } else if([request.url isEqual:STATUS_URL] && request.method == ApiRequestMethodPost) {
        if ([response success]) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.navigationController popViewControllerAnimated:YES];
            if ([self.delegate respondsToSelector:@selector(createStatusViewControllerDidCreateNewStatus:)]) {
                [self.delegate createStatusViewControllerDidCreateNewStatus:self];
            }
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }
}

#pragma mark - BMKUserLocationDelegate

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    self.location = [[CLLocation alloc] initWithLatitude:userLocation.location.coordinate.latitude longitude:userLocation.location.coordinate.longitude];
}

@end
