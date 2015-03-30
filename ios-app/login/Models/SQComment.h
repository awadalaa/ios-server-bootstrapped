//
//  SQComment.h
//  login
//
//  Created by Alaa M Awad on 3/30/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SQUser;

@interface SQComment : NSObject <NSCoding>

@property (nonatomic, strong) NSString *idNumber;

@property (nonatomic, strong) SQUser *from;
@property (nonatomic, strong) NSString *text;

- (instancetype) initWithDictionary:(NSDictionary *)commentDictionary;

@end