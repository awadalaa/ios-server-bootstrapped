//
//  SQCameraToolbar.h
//  login
//
//  Created by Alaa M Awad on 3/31/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQCameraToolbar;

@protocol SQCameraToolbarDelegate <NSObject>

- (void) leftButtonPressedOnToolbar:(SQCameraToolbar *)toolbar;
- (void) rightButtonPressedOnToolbar:(SQCameraToolbar *)toolbar;
- (void) cameraButtonPressedOnToolbar:(SQCameraToolbar *)toolbar;

@end

@interface SQCameraToolbar : UIView
- (instancetype) initWithImageNames:(NSArray *)imageNames;

@property (nonatomic, weak) NSObject<SQCameraToolbarDelegate> *delegate;
@end
