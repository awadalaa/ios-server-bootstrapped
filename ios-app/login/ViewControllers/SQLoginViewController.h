//
//  LoginController.h
//  login
//
//  Created by Alaa Awad on 21/08/2014.
//  Copyright (c) 2014 Technalaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthenticationDelegate.h"

@protocol AuthenticationDelegate;

@interface SQLoginViewController : UIViewController <UITextFieldDelegate,AuthenticationDelegate>
extern NSString *const SQLoginViewControllerDidGetAccessTokenNotification;
@property (nonatomic, weak) id<AuthenticationDelegate> authenticationDelegate;

@end
