//
//  SQNetworking.h
//  login
//
//  Created by Alaa Awad on 11/28/14.
//  Copyright (c) 2014 Technalaa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQNetworking : NSObject

+ (void) makeRequestToEndPoint:(NSString *) endpoint values:(NSDictionary *)params onCompletion:(void (^)(NSDictionary *dictionary, NSError *returnError)) responseHandler;

@end
