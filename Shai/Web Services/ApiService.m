//
//  ApiService.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/16/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "ApiService.h"
#import "AFNetworking.h"

@interface ApiService () {
    NSOperationQueue *_requestQueue;
}

@end

@implementation ApiService

#pragma mark - Object Lifecycle

- (id)init {
    if (self = [super init]) {
        _requestQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}

#pragma mark - Public Methods

+ (instancetype)serviceWithDelegate:(id<ApiServiceDelegate>)delegate {
    ApiService *service = [[self alloc] init];
    service.delegate = delegate;
    return service;
}

- (void)sendJSONRequest:(ApiRequest *)apiRequest {
    [self sendRequest:apiRequest withCompletion:^(id dictionary, NSError *error) {
        ApiResponse *apiResponse = [ApiResponse responseWithDictionary:dictionary error:error];
        if ([self.delegate respondsToSelector:@selector(service:didFinishRequest:withResponse:)]) {
            [self.delegate service:self didFinishRequest:apiRequest withResponse:apiResponse];
        }
    }];
}

#pragma mark - Private Methods

- (void)sendRequest:(ApiRequest *)apiRequest withCompletion:(void (^)(id dictionary, NSError *error))completion {
    if ([self.delegate respondsToSelector:@selector(service:willStartRequest:)]) {
        [self.delegate service:self willStartRequest:apiRequest];
    }
    switch (apiRequest.method) {
        case ApiRequestMethodGet:
            [self sendGetRequest:apiRequest withCompletion:completion];
            break;
        case ApiRequestMethodPost:
            [self sendPostRequest:apiRequest withCompletion:completion];
            break;
        default:
            break;
    }
    
}

- (void)sendGetRequest:(ApiRequest *)apiRequest withCompletion:(void (^)(id data, NSError *error))completion {
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:[self getUrlFactoryWithApiService:apiRequest] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        responseObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        completion(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

- (void)sendPostRequest:(ApiRequest *)apiRequest withCompletion:(void (^)(id data, NSError *error))completion {
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger POST:apiRequest.url parameters:apiRequest.parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        responseObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        completion(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

- (NSString *)getUrlFactoryWithApiService:(ApiRequest *)apiRequest {
    return [NSString stringWithFormat:@"%@/%@",apiRequest.url, [apiRequest.parameters objectForKey:@"id"]];
}

@end
