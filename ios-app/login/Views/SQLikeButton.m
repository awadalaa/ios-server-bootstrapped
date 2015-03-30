//
//  SQLikeButton.m
//  login
//
//  Created by Alaa M Awad on 3/30/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import "SQLikeButton.h"
#import "SQCircleSpinnerView.h"

#define kLikedStateImage @"heart-full"
#define kUnlikedStateImage @"heart-empty"

@interface SQLikeButton ()

@property (nonatomic, strong) SQCircleSpinnerView *spinnerView;

@end

@implementation SQLikeButton

- (instancetype) init {
    self = [super init];
    
    if (self) {
        self.spinnerView = [[SQCircleSpinnerView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [self addSubview:self.spinnerView];
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        
        self.likeButtonState = SQLikeStateNotLiked;
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    self.spinnerView.frame = self.imageView.frame;
}

- (void) setLikeButtonState:(SQLikeState)likeState {
    _likeButtonState = likeState;
    
    NSString *imageName;
    
    switch (_likeButtonState) {
        case SQLikeStateLiked:
        case SQLikeStateUnliking:
            imageName = kLikedStateImage;
            break;
            
        case SQLikeStateNotLiked:
        case SQLikeStateLiking:
            imageName = kUnlikedStateImage;
    }
    
    switch (_likeButtonState) {
        case SQLikeStateLiking:
        case SQLikeStateUnliking:
            self.spinnerView.hidden = NO;
            self.userInteractionEnabled = NO;
            break;
            
        case SQLikeStateLiked:
        case SQLikeStateNotLiked:
            self.spinnerView.hidden = YES;
            self.userInteractionEnabled = YES;
    }
    
    
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

@end
