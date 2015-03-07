//
//  SQNetworking.m
//  login
//
//  Created by Alaa Awad on 11/28/14.
//  Copyright (c) 2014 Alaa Awad. All rights reserved.
//

#import "SQNetworking.h"
#import "NSDictionary+UrlEncoding.h"
#define APIHost @"http://localhost:1337"

@implementation SQNetworking


+ (void) makeRequestToEndPoint:(NSString *) endpoint values:(NSDictionary *)params onCompletion:(void (^)(NSDictionary *dictionary, NSError *returnError)) responseHandler
{
    NSString * urlString = [self createApiUrlFromEndpoint:endpoint];
    NSURL * url = [NSURL URLWithString: urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //[request setValue:@"charset" forHTTPHeaderField:@"utf-8"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSLog(@"%@",[params toJsonString]);
    request.HTTPBody = [[params toJsonString] dataUsingEncoding:NSUTF8StringEncoding];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSDictionary *dictionary;
         NSError *returnError;
         NSString *errorCode;
         NSString *errorText;
         NSInteger newErrorCode = 0;
         
         if([data length] >= 1) {
             dictionary = [NSJSONSerialization JSONObjectWithData: data options: 0 error: nil];
         }
         
         if(dictionary != nil) {
             
             if([dictionary objectForKey: @"error_code"] != nil) {
                 errorCode = [dictionary objectForKey: @"error_code"];
                 errorText = [dictionary objectForKey: @"error_description"];
             }
         }
         
         NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
         
         if(statusCode >= 400)
         {
             if(errorCode == nil)
             {
                 newErrorCode = -1;
                 errorText = @"There was an unexpected error.";
             }
             else {
                 newErrorCode = [errorCode intValue];
             }
             
             NSMutableDictionary* details = [NSMutableDictionary dictionary];
             [details setValue: errorText forKey:NSLocalizedDescriptionKey];
             
             returnError = [NSError errorWithDomain: NSURLErrorDomain code: newErrorCode userInfo: details];
         }
         
         responseHandler(dictionary, returnError);
         
     }];
}

+(NSString *)createApiUrlFromEndpoint:(NSString *)endpoint{
    NSString *ApiUrlString = [NSString stringWithFormat:@"%@%@",APIHost,endpoint];
    NSLog(@"%@",ApiUrlString);
    return ApiUrlString;
}

@end
