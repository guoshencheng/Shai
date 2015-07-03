//
//  Status.h
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Status : NSManagedObject

@property (nonatomic, retain) NSNumber * statusId;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSNumber * referTime;
@property (nonatomic, retain) NSManagedObject *user;
@property (nonatomic, retain) NSManagedObject *postImageUrls;

@end
