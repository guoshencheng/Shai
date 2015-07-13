//
//  StatusCollectionViewDatasource.h
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "StatusCollectionViewCell.h"

typedef void (^ConfigureStatusCellBlock) (UICollectionViewCell *cell);

@interface StatusCollectionViewDatasource : NSObject <UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *status;
@property (strong, nonatomic) ConfigureStatusCellBlock configureStatusCellBlock;

@end
