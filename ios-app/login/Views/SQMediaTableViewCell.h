//
//  SQMediaTableViewCell.h
//  login
//
//  Created by Alaa M Awad on 3/31/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#define isPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

@class SQMedia, SQMediaTableViewCell;
/*, SQComposeCommentView;*/

@protocol SQMediaTableViewCellDelegate <NSObject>

- (void) cell:(SQMediaTableViewCell *)cell didTapImageView:(UIImageView *)imageView;
- (void) cell:(SQMediaTableViewCell *)cell didLongPressImageView:(UIImageView *)imageView;
- (void) cellDidPressLikeButton:(SQMediaTableViewCell *)cell;
- (void) cellWillStartComposingComment:(SQMediaTableViewCell *)cell;
- (void) cell:(SQMediaTableViewCell *)cell didComposeComment:(NSString *)comment;

@end

@interface SQMediaTableViewCell : UITableViewCell

@property (nonatomic, strong) SQMedia *mediaItem;
@property (nonatomic, weak) id <SQMediaTableViewCellDelegate> delegate;
//@property (nonatomic, strong, readonly) SQComposeCommentView *commentView;

+ (CGFloat) heightForMediaItem:(SQMedia *)mediaItem width:(CGFloat)width;

//- (void) stopComposingComment;

@end
