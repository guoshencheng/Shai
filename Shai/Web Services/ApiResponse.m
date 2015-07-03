//
//  ApiResponse.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/16/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "ApiResponse.h"
#import "StatusTool.h"

@implementation ApiResponse

+ (instancetype)getResponseWithDictionary:(NSDictionary *)dictionary error:(NSError *)error {
    ApiResponse *response = [[self alloc] init];
    if (error || ![dictionary isKindOfClass:[NSDictionary class]]) {
        
    } else  {
        response.version = [[dictionary objectForKey:@"version"] floatValue];
        response.encoding = [dictionary objectForKey:@"encoding"];
        response.errorCode = [dictionary objectForKey:@"errorCode"];
        response.errorMsg = [dictionary objectForKey:@"errorMsg"];
        NSDictionary *feed = [dictionary objectForKey:@"feed"];
        response.entities = [feed objectForKey:@"entities"];
    }
    return response;
}

+ (instancetype)postResponseWithDictionary:(NSDictionary *)dictionary error:(NSError *)error {
    ApiResponse *response = [[self alloc] init];
    if (error || ![dictionary isKindOfClass:[NSDictionary class]]) {
        
    } else  {
        response.version = [[dictionary objectForKey:@"version"] floatValue];
        response.encoding = [dictionary objectForKey:@"encoding"];
        response.errorCode = [dictionary objectForKey:@"errorCode"];
        response.errorMsg = [dictionary objectForKey:@"errorMsg"];
    }
    return response;
}

- (BOOL)success {
    return [self.errorCode integerValue] == 200;
}

#pragma mark - DTO Factory

- (NSArray *)statusToolsObjectFactory {
    NSMutableArray *statusTools = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.entities.count; i ++) {
        NSDictionary *entity = [[self.entities objectAtIndex:i] objectForKey:@"model"];
        NSString *avatarUrl = [entity objectForKey:@"avatarUrl"];
        NSString *detail = [entity objectForKey:@"details"];
        NSInteger statusId = [[entity objectForKey:@"id"] integerValue];
        NSArray *imageUrls = [entity objectForKey:@"imageUrls"];
        NSString *location = [entity objectForKey:@"location"];
        NSString *nickName = [entity objectForKey:@"nickName"];
        NSInteger referTime = [[entity objectForKey:@"referTime"] integerValue];
        NSInteger userId = [[entity objectForKey:@"userId"] integerValue];
        StatusTool *statusTool = [StatusTool createWithNickName:nickName selfDecription:detail location:location posterImage:imageUrls sendDate:[NSDate dateWithTimeIntervalSince1970:referTime / 1000.0] avatarUrl:avatarUrl userId:userId statusId:statusId];
        [statusTools addObject:statusTool];
    }
    return statusTools;
}

@end
