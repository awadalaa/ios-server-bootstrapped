//
//  SQNavigationController.m
//  login
//
//  Created by Alaa Awad on 11/28/14.
//  Copyright (c) 2014 Alaa Awad. All rights reserved.
//

#import "SQNavigationController.h"

@interface SQNavigationController ()

@end

@implementation SQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationBar setBarTintColor:[UIColor colorWithRed:241.0/255 green:106.0/255 blue:105.0/255 alpha:1.0]];
    
    [self.navigationController.toolbar setHidden: YES];
    [self.navigationController.toolbar removeFromSuperview];
    
}
@end
