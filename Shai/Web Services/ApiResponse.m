//
//  ApiResponse.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/16/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "ApiResponse.h"

@implementation ApiResponse

+ (instancetype)responseWithDictionary:(NSDictionary *)dictionary error:(NSError *)error {
    ApiResponse *response = [[self alloc] init];
    if (error || ![dictionary isKindOfClass:[NSDictionary class]]) {
        
    } else  {
        response.version = [[dictionary objectForKey:@"version"] floatValue];
        response.encoding = [dictionary objectForKey:@"encoding"];
        NSDictionary *feed = [dictionary objectForKey:@"feed"];
        response.sendUrl = [feed objectForKey:@"id"];
        response.entities = [feed objectForKey:@"entities"];
    }
    return response;
}

@end
