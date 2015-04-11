//
//  KeychainItemWrapper.h
//  login
//
//  Created by Alaa Awad on 3/8/15.
//  Copyright (c) 2015 Technalaa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

//Define an Objective-C wrapper class to hold Keychain Services code.
@interface KeychainItemWrapper : NSObject {
    NSMutableDictionary        *keychainData;
    NSMutableDictionary        *genericPasswordQuery;
}

@property (nonatomic, strong) NSDictionary *keychainData;
@property (nonatomic, strong) NSDictionary *genericPasswordQuery;

- (void)mySetObject:(id)inObject forKey:(id)key;
- (id)myObjectForKey:(id)key;
- (void)resetKeychainItem;

@end
