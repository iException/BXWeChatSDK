//
//  BXAppDelegate.m
//  BXWeChatSDK
//
//  Created by Yiming Tang on 01/28/2016.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import <BXWeChatSDK/WXApi.h>
#import "BXAppDelegate.h"
#import "BXViewController.h"

#warning Replace the string with your own WeChat App ID.
static NSString *const kWeChatAppID = @"YOUR_WECHAT_APP_ID";

@interface BXAppDelegate () <WXApiDelegate>

@end


@implementation BXAppDelegate

@synthesize window = _window;


#pragma mark - UIApplicaitonDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [WXApi registerApp:kWeChatAppID];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[BXViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    return [WXApi handleOpenURL:url delegate:self];
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [WXApi handleOpenURL:url delegate:self];
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:self];
}


#pragma mark - WXApiDelegate

- (void)onReq:(BaseReq *)req {
    NSLog(@"WeChat API delegate [onRequest]: <%@>", req);
}


- (void)onResp:(BaseResp *)resp {
    NSLog(@"WeChat API delegate [onResponse]: <%@>", resp);
    if ([resp isKindOfClass:[SendAuthResp class]]) {
        SendAuthResp *authResponse = (SendAuthResp *)resp;
        NSLog(@"Auth Response: %@\n Code: %@", authResponse, authResponse.code);
    }
}

@end
