//
//  AppDelegate.h
//  MeBingo
//
//  Created by Anthony Yanto on 3/3/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GigyaSDK/FacebookSDK.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    NSString *isAuth;
     NSString *sess;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) FBSession *session;
- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;
@end
