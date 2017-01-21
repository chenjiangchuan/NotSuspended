//
//  AppDelegate.m
//  NtoSuspended
//
//  Created by chenjiangchuan on 2017/1/21.
//  Copyright © 2017年 Sayee Intelligent Technology. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self saveBackgroundRun:application];
}

/**
 *  保证后台一直运行
 */
-(void)saveBackgroundRun:(UIApplication *)application{
    __block UIBackgroundTaskIdentifier background_task;
    
    background_task = [application beginBackgroundTaskWithExpirationHandler:^ {
        [application endBackgroundTask: background_task];
        background_task = UIBackgroundTaskInvalid;
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while(true)
        {
            NSTimeInterval sleepTime = 2.0f;
            NSLog(@"每%f分钟唤醒一次", sleepTime/60);
            [NSThread sleepForTimeInterval:sleepTime];
        }
    });
}

@end
