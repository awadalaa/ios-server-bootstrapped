//
//  LoginController.h
//  login
//
//  Created by Alaa Awad on 21/08/2014.
//  Copyright (c) 2014 Alaa Awad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthenticationDelegate.h"

@protocol AuthenticationDelegate;

@interface LoginController : UIViewController <UITextFieldDelegate,AuthenticationDelegate>

@property (nonatomic, weak) id<AuthenticationDelegate> delegate;

@end
