//
//  SQLikeButton.h
//  login
//
//  Created by Alaa M Awad on 3/30/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SQLikeState) {
    SQLikeStateNotLiked             = 0,
    SQLikeStateLiking               = 1,
    SQLikeStateLiked                = 2,
    SQLikeStateUnliking             = 3
};

@interface SQLikeButton : UIButton

/**
 The current state of the like button. Setting to SQLikeButtonNotLiked or SQLikeButtonLiked will display an empty heart or a heart, respectively. Setting to SQLikeButtonLiking or SQLikeButtonUnliking will display an activity indicator and disable button taps until the button is set to SQLikeButtonNotLiked or SQLikeButtonLiked.
 */
@property (nonatomic, assign) SQLikeState likeButtonState;
@end
