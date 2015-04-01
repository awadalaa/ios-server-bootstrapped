//
//  UIImage+SQImageUtilities.h
//  login
//
//  Created by Alaa M Awad on 3/31/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SQImageUtilities)

- (UIImage *) imageWithFixedOrientation;
- (UIImage *) imageResizedToMatchAspectRatioOfSize:(CGSize)size;
- (UIImage *) imageCroppedToRect:(CGRect)cropRect;

@end
