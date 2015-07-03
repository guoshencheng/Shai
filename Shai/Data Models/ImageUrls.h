//
//  ImageUrls.h
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Status;

@interface ImageUrls : NSManagedObject

@property (nonatomic, retain) NSString * imageUrl;
@property (nonatomic, retain) Status *status;

@end
