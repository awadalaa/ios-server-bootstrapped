//
//  SQCropViewController.h
//  login
//
//  Created by Alaa M Awad on 3/31/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQMediaFullScreenViewController.h"

@class SQCropImageViewController;

@protocol SQCropImageViewControllerDelegate <NSObject>

- (void) cropControllerFinishedWithImage:(UIImage *)croppedImage;

@end

@interface SQCropImageViewController : SQMediaFullScreenViewController

- (instancetype) initWithImage:(UIImage *)sourceImage;

@property (nonatomic, weak) NSObject <SQCropImageViewControllerDelegate> *delegate;

@end
