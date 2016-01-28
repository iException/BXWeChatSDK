//
//  BXAppDelegate.m
//  BXWeChatSDK
//
//  Created by Yiming Tang on 01/28/2016.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXAppDelegate.h"
#import "BXViewController.h"

@implementation BXAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[BXViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
