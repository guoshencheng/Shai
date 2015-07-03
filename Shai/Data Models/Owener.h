//
//  Owener.h
//  Shai
//
//  Created by guoshencheng on 7/3/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Owener : NSManagedObject

@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * nickName;
@property (nonatomic, retain) NSString * avatarUrl;
@property (nonatomic, retain) NSString * accessToken;

@end
