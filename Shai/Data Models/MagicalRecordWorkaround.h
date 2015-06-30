//
//  MagicalRecordWorkaround.h
//  ArchitectureProject
//
//  Created by guoshencheng on 6/11/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalRecordWorkaround : NSObject

+ (void)setupCoreDataStackWithAutoMigratingSqliteStoreNamed:(NSString *)storeName;

@end


