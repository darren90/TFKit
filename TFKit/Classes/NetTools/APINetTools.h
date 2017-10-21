//
//  APINetTools.h
//  RollClient
//
//  Created by Fengtf on 2017/10/11.
//  Copyright © 2017年 tengfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APINetTools : NSObject

+ (void)GET:(NSString *)url parms:(NSDictionary *)parms fininsh:(void (^)(id request, NSError *error))fininsh;

+ (void)POST:(NSString *)url parms:(NSDictionary *)parms fininsh:(void (^)(id request, NSError *error))fininsh;

@end
