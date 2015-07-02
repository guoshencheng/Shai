//
//  ApiRequest.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/16/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "ApiRequest.h"
#import "NSBase64.h"

@implementation ApiRequest

#pragma mrak - PublicMethod

- (NSString *)assembleParameters {
    NSMutableArray *parts = [NSMutableArray array];
    for (NSString *key in [self.parameters allKeys]) {
        NSString *part = [NSString stringWithFormat:@"%@=%@", key, [self.parameters valueForKey:key]];
        [parts addObject: part];
    }
    
    return [parts componentsJoinedByString: @"&"];
}

#pragma mark - FactoryMethod

+ (instancetype)requestForTestServer {
    ApiRequest *request = [self defaultRequest];
    request.url = @"http://10.0.2.217:8888/api";
    request.parameters = @{@"id":@"books" };
    return  request;
}

+ (instancetype)requestForGetAllUserAllStatus {
    ApiRequest *request = [self defaultRequest];
    request.url = @"http://10.0.2.217:8888/api/statuses";
    request.parameters = nil;
    return request;
}

+ (instancetype)requestForGetAllStatusWithId:(NSInteger)userId {
    ApiRequest *request = [self defaultRequest];
    request.url = [NSString stringWithFormat:@"http://10.0.2.217:8888/api/user/%d/statuses", userId];
    request.parameters = nil;
    return request;
}

+ (instancetype)requestForLoginWithUserId:(NSString *)userId nickName:(NSString *)nickName avatarUrl:(NSString *)avatarUrl {
    ApiRequest *request = [self defaultRequest];
    request.method = ApiRequestMethodPost;
    request.url = @"http://10.0.2.217:8888/api/login";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:userId forKey:@"userId"];
    [dic setValue:nickName forKey:@"nickName"];
    [dic setValue:avatarUrl forKey:@"avatarUrl"];
    request.parameters = [ApiRequest createPostParametersWithParameters:dic];
    return request;
}

+ (instancetype)requestForCreateStatusWith:(NSString *)details location:(NSString *)location imageUrls:(NSArray *)imageUrls {
    ApiRequest *request = [self defaultRequest];
    request.method = ApiRequestMethodPost;
    request.url = @" http://10.0.2.217:8888/api/statuses";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:details forKey:@"details"];
    [dic setValue:location forKey:@"location"];
    [dic setValue:imageUrls forKey:@"imageUrls"];
    [dic setValue:@((NSInteger)[[NSDate date] timeIntervalSince1970]) forKey:@"referTime"];
    request.parameters = [ApiRequest createPostParametersWithParameters:dic];
    return request;
}

+ (instancetype)requestForUploadPictureWithUserId:(NSString *)userId andImage:(UIImage *)image {
    ApiRequest *request = [self defaultRequest];
    request.method = ApiRequestMethodPost;
    request.url = @"http://10.0.2.217:8888/api/images";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:userId forKey:@"userId"];
    [dic setValue:@((NSInteger)[[NSDate date] timeIntervalSince1970]) forKey:@"referTime"];
    NSString *imageString =  [UIImagePNGRepresentation(image) base64EncodedString];
    [dic setValue:imageString forKey:@"imageString"];
    request.parameters = [ApiRequest createPostParametersWithParameters:dic];
    return request;
}

#pragma mark - Private Methods

+ (instancetype)defaultRequest {
    ApiRequest *request = [[ApiRequest alloc] init];
    request.method = ApiRequestMethodGet;
    request.parameters = [NSMutableDictionary dictionary];
    return request;
}

+ (NSDictionary *)createPostParametersWithParameters:(NSDictionary *)parameters {
    return @{@"version":@"1.0", @"encoding":@"UTF-8", @"entity":@{@"model":parameters}};
}

@end
