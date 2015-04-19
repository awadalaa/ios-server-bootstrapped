//
//  LoginController.m
//  login
//
//  Created by Alaa Awad on 11/28/14.
//  Copyright (c) 2014 Technalaa. All rights reserved.
//

#import "SQLoginViewController.h"
#import "SQImagesTableViewController.h"
#import "SQNetworking.h"
#import "KeychainItemWrapper.h"

@interface SQLoginViewController()
@property (strong, nonatomic) UIView *textContainer;
@property (strong, nonatomic) UITextField *emailText;
@property (strong, nonatomic) UITextField *passwordText;
@property (strong, nonatomic) UILabel *divider;
@property (strong, nonatomic) UIButton *loginButton;
- (IBAction)login:(id)sender;
@end

@implementation SQLoginViewController
NSString *const SQLoginViewControllerDidGetAccessTokenNotification = @"SQLoginViewControllerDidGetAccessTokenNotification";
#define kOFFSET_FOR_KEYBOARD 80.0


-(void)viewDidLoad{
    [super viewDidLoad];
    self.textContainer = [[UIView alloc] initWithFrame:CGRectMake(21, 140, 280, 112)];
    [self.textContainer setBackgroundColor:[UIColor groupTableViewBackgroundColor]];

    self.emailText = [[UITextField alloc] initWithFrame:CGRectMake(20, 14, 240, 30)];
    self.emailText.placeholder = @"email";
    self.emailText.borderStyle = UITextBorderStyleNone;
    self.emailText.font = [UIFont systemFontOfSize:14];
    self.emailText.minimumFontSize = 17.0;
    //[self.emailText sizeToFit];
    self.emailText.textAlignment = NSTextAlignmentLeft;
    self.emailText.autocorrectionType = UITextAutocorrectionTypeNo;
    self.emailText.keyboardType = UIKeyboardTypeDefault;
    self.emailText.returnKeyType = UIReturnKeyDone;
    self.emailText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.emailText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.emailText setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    self.emailText.delegate = self;

    self.divider = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, 280, 1)];
    [self.divider setBackgroundColor:[UIColor lightGrayColor]];


    self.passwordText = [[UITextField alloc] initWithFrame:CGRectMake(20, 72, 240, 30)];
    self.passwordText.placeholder = @"password";
    self.passwordText.borderStyle = UITextBorderStyleNone;
    self.passwordText.font = [UIFont systemFontOfSize:14];
    self.passwordText.minimumFontSize = 17.0;
    self.passwordText.textAlignment = NSTextAlignmentLeft;
    //[self.passwordText sizeToFit];
    self.passwordText.keyboardType = UIKeyboardTypeDefault;
    self.passwordText.returnKeyType = UIReturnKeyDone;
    self.passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.passwordText.secureTextEntry = YES;
    self.passwordText.enablesReturnKeyAutomatically = YES;
    [self.passwordText setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    self.passwordText.delegate = self;

    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(21, 260, 280, 60)];
    [self.loginButton setTintColor:[UIColor whiteColor]];
    [self.loginButton setBackgroundColor:[UIColor colorWithRed:0.345 green:0.318 blue:0.424 alpha:1]]; /*#58516c*/
    [self.loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];

    UIView* view = [[UIView alloc] initWithFrame:self.view.frame];

    [self.textContainer addSubview:self.emailText];
    [self.textContainer addSubview:self.passwordText];
    [self.textContainer addSubview:self.divider];
    [self.textContainer addSubview:self.loginButton];
    [view addSubview:self.textContainer];
    [view addSubview:self.loginButton];

    [self.view addSubview:view];

    //self.authenticationDelegate = self;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)sender{
    /*if ([sender isEqual:self.emailText] || [sender isEqual:self.passwordText])
    {
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }else if (self.view.frame.origin.y < 0)
        {
            [self setViewMovedUp:NO];
        }
    }*/
}
/*
-(void)keyboardWillShow {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:NO];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:NO];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}*/


-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view

    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;

    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Set focus to the email text view
    [self.emailText becomeFirstResponder];
    /*[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];*/
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    /*[[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];*/
}

- (void) loginSuccessful
{
    // segue happens with access token notification
    self.emailText.text = self.passwordText.text = nil;
}

- (void)login:(id)sender
{
    if (self.emailText.text.length != 0 &&
        self.passwordText.text.length != 0) {
        [self performSelector:@selector(loginRequest) withObject:nil];
    } else {
        [self loginError];
    }
}

-(void)loginRequest{
    UIActivityIndicatorView* indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicatorView setFrame:CGRectMake(0, 0, 16, 16)];
    [indicatorView setCenter:self.view.center];
    [indicatorView setHidesWhenStopped:YES];
    [indicatorView startAnimating];
    [self.view addSubview:indicatorView];
    NSDictionary *params = [[NSDictionary alloc] initWithObjects:@[@"password",@"mobile_ios_client",@"secretsaucebaby",self.emailText.text,self.passwordText.text] forKeys:@[@"grant_type",@"client_id",@"client_secret",@"username",@"password"]];
    [SQNetworking makeRequestToEndPoint:@"/oauth/token" values:params onCompletion:^(NSDictionary *response,NSError *error){
        [indicatorView stopAnimating];
        [indicatorView removeFromSuperview];
        if (response!=nil){
            if ([response objectForKey:@"error"]){
                [self loginError];
            }else{
                KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] init];
                [keychain setKeychainData:response];
                NSLog(@"access notification %@",response[@"access_token"]);
                [[NSNotificationCenter defaultCenter] postNotificationName:SQLoginViewControllerDidGetAccessTokenNotification object:response[@"access_token"]];
                [self loginSuccessful];
            }
        }else{
            [self loginError];
        }

    }];


}


-(void)loginError{
    __block UIAlertView *alert =
    [[UIAlertView alloc]
     initWithTitle:@"Login Failed"
     message:@"Either your email or password is incorrect. Please try again."
     delegate:nil
     cancelButtonTitle:nil
     otherButtonTitles:nil];
    [alert show];

    // Hide the alert
    double delayInSeconds = 2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    });

}
@end
