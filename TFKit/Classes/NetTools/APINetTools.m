//
//  APINetTools.m
//  RollClient
//
//  Created by Fengtf on 2017/10/11.
//  Copyright © 2017年 tengfei. All rights reserved.
//

#import "APINetTools.h"
#import <AFNetworking.h>

@implementation APINetTools

+ (void)GET:(NSString *)url parms:(NSDictionary *)parms fininsh:(void (^)(id request, NSError *error))fininsh {
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //    mgr.responseSerializer.acceptableContentTypes  = [NSSet setWithObject:@"application/json"];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    [mgr.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    mgr.responseSerializer  = [AFJSONResponseSerializer serializer];
    
    //发送请求
//    __unsafe_unretained __typeof(self) weakSelf = self;
    [mgr GET:url parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {//responseObject 字典
         fininsh(responseObject, nil);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         fininsh(nil, error);
     }];
}

+ (void)POST:(NSString *)url parms:(NSDictionary *)parms fininsh:(void (^)(id request, NSError *error))fininsh {
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //    mgr.responseSerializer.acceptableContentTypes  = [NSSet setWithObject:@"application/json"];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    [mgr.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    mgr.responseSerializer  = [AFJSONResponseSerializer serializer];
    
    //发送请求
    //    __unsafe_unretained __typeof(self) weakSelf = self;
    [mgr POST:url parameters:nil
     success:^(AFHTTPRequestOperation *operation, id responseObject) {//responseObject 字典
         fininsh(responseObject, nil);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         fininsh(nil, error);
     }];
}


@end
