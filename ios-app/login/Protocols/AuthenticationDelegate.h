//
//  AuthenticationDelegate.h
//  login
//
//  Created by Alaa Awad on 3/7/15.
//  Copyright (c) 2015 Paul Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AuthenticationDelegate <NSObject>

@required
- (void)authenticatedSuccess:(BOOL)success result:(NSDictionary *)result;
- (void)displayActivityIndicator;
- (void)hideActivityIndicator;

@end