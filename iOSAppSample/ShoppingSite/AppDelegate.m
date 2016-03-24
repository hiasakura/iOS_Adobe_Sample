//
//  AppDelegate.m
//  ShoppingSite
//
//  Created by asakura hirofumi on 2014/12/31.
//  Copyright (c) 2014年 hirofumi. All rights reserved.
//

#import "AppDelegate.h"
#import "ADBMobile.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Adobeアプリ計測
    [ADBMobile setDebugLogging:YES];
    [ADBMobile collectLifecycleData];
    
    // プッシュ通知の許可
    if ([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending)
    {
        // iOS7以前
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    } else {
        // iOS8以降
        UIUserNotificationType types =  UIUserNotificationTypeBadge |
        UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [application registerUserNotificationSettings:mySettings];
        [application registerForRemoteNotifications];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // only send the hit if the app is not active
    if (application.applicationState != UIApplicationStateActive) {
        [ADBMobile trackPushMessageClickThrough:userInfo];
    }
    completionHandler(UIBackgroundFetchResultNoData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // only send the hit if the app is not active
    if (application.applicationState != UIApplicationStateActive) {
        [ADBMobile trackPushMessageClickThrough:userInfo];
    }
}

// デバイストークン取得呼出処理
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:
(UIUserNotificationSettings *)notificationSettings{
    // これ呼ばないとデバイストークン取得できない
    [application registerForRemoteNotifications];
}

// デバイストークンの取得・送信
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSString *token = deviceToken.description;
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"Device Token = %@", token);
    NSString *mcid = [ADBMobile visitorMarketingCloudID];
    [ADBMobile setUserIdentifier:mcid];
    [ADBMobile setPushIdentifier:deviceToken];
    
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"error: %@", error);
}

@end
