//
//  NSDictionary+UrlEncoding.h
//  login
//
//  Created by Alaa Awad on 11/29/14.
//  Copyright (c) 2014 Technalaa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (UrlEncoding)
-(NSString*) urlEncodedString;
-(NSString*) toJsonString;
@end
