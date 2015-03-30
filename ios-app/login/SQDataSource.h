//
//  SQDataSource.h
//  login
//
//  Created by Alaa M Awad on 3/29/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SQMedia;

typedef void (^SQNewItemCompletionBlock)(NSError *error);

@interface SQDataSource : NSObject

extern NSString *const SQImageFinishedNotification;

+ (instancetype) sharedInstance;
+ (NSString *) SQClientID;

@property (nonatomic, strong, readonly) NSArray *mediaItems;
@property (nonatomic, strong, readonly) NSString *accessToken;

- (void) deleteMediaItem:(SQMedia *)item;

- (void) requestNewItemsWithCompletionHandler:(SQNewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(SQNewItemCompletionBlock)completionHandler;

- (void) downloadImageForMediaItem:(SQMedia *)mediaItem;

- (void) toggleLikeOnMediaItem:(SQMedia *)mediaItem;
- (void) commentOnMediaItem:(SQMedia *)mediaItem withCommentText:(NSString *)commentText;

@end

