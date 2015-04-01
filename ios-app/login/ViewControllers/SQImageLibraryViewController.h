//
//  SQImageLibraryViewController.h
//  login
//
//  Created by Alaa M Awad on 3/31/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQImageLibraryViewController;

@protocol SQImageLibraryViewControllerDelegate <NSObject>

- (void) imageLibraryViewController:(SQImageLibraryViewController *)imageLibraryViewController didCompleteWithImage:(UIImage *)image;

@end

@interface SQImageLibraryViewController : UICollectionViewController

@property (nonatomic, weak) NSObject <SQImageLibraryViewControllerDelegate> *delegate;

@end