//
//  HomeViewController+LogicalFlow.m
//  Shai
//
//  Created by guoshencheng on 7/2/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+LogicalFlow.h"
#import "HomeViewController+Configuration.h"
#import "Status+DataManager.h"

@implementation HomeViewController (LogicalFlow)

- (void)sendStatusRequest {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[ApiService serviceWithDelegate:self] sendJSONRequest:[ApiRequest requestForGetAllUserAllStatus]];
}

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    if ([response success]) {
        NSArray *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"sendDate" ascending:NO]];
        self.status = [[response statusToolsObjectFactory] sortedArrayUsingDescriptors:sortDescriptors];
        [self saveAllStatusWithStatusTools:self.status];
        [self reloadData];
    }
}

- (void)StatusCollectionViewCell:(StatusCollectionViewCell *)statusCollectionViewCell didLoadImage:(UIImage *)image {
    [self.blurImageBackgroundView updateImageWithImage:image];
}

- (void)saveAllStatusWithStatusTools:(NSArray *)statusTools {
    [Status saveAllStatusWithStatuTools:statusTools completion:nil];
}

- (NSArray *)getAllStatus {
    return [Status getStatusTool];
}

@end
