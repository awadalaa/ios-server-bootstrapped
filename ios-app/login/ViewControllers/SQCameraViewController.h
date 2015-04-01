//
//  SQ
//  login
//
//  Created by Alaa M Awad on 3/31/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQCameraViewController;

@protocol SQCameraViewControllerDelegate <NSObject>

- (void) cameraViewController:(SQCameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image;

@end

@interface SQCameraViewController : UIViewController

@property (nonatomic, weak) NSObject <SQCameraViewControllerDelegate> *delegate;

@end
