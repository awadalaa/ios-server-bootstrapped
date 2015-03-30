//
//  SQMedia.h
//  login
//
//  Created by Alaa M Awad on 3/30/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SQLikeButton.h"

typedef NS_ENUM(NSInteger, SQMediaDownloadState) {
    SQMediaDownloadStateNeedsImage             = 0,
    SQMediaDownloadStateDownloadInProgress     = 1,
    SQMediaDownloadStateNonRecoverableError    = 2,
    SQMediaDownloadStateHasImage               = 3
};

@class SQUser;

@interface SQMedia : NSObject <NSCoding>

@property (nonatomic, strong) NSString *idNumber;

@property (nonatomic, strong) SQUser *user;

@property (nonatomic, strong) NSURL *mediaURL;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) SQMediaDownloadState downloadState;

@property (nonatomic, strong) NSString *caption;

@property (nonatomic, strong) NSArray *comments;

@property (nonatomic, assign) SQLikeState likeState;

@property (nonatomic, strong) NSString *temporaryComment;

- (instancetype) initWithDictionary:(NSDictionary *)mediaDictionary;

@end
