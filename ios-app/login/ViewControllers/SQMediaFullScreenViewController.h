//
//  SQMediaFullScreenViewController.h
//  login
//
//  Created by Alaa M Awad on 3/31/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#define isPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
@class SQMedia;

@interface SQMediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) SQMedia *media;

- (instancetype) initWithMedia:(SQMedia *)media;

- (void) centerScrollView;

- (void) recalculateZoomScale;

@end