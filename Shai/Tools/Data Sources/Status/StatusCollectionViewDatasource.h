//
//  StatusCollectionViewDatasource.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusCollectionViewDatasource : NSObject <UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *status;

@end
