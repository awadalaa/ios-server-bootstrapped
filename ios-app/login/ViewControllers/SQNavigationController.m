//
//  SQNavigationController.m
//  login
//
//  Created by Alaa Awad on 11/28/14.
//  Copyright (c) 2014 Technalaa. All rights reserved.
//

#import "SQNavigationController.h"

@interface SQNavigationController ()

@end

@implementation SQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:0.345 green:0.318 blue:0.424 alpha:1]]; /*#58516c*/
    
    [self.navigationController.toolbar setHidden: YES];
    [self.navigationController.toolbar removeFromSuperview];
    
}
@end
