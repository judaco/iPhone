//
//  AppDelegate.m
//  Audio in Background
//
//  Created by Juda Cossa on 27/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate () <AVAudioPlayerDelegate>

@end

@implementation AppDelegate
{
    AVAudioPlayer * audioPlayer;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //closure = what I want that will happen
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"handleInterruption:") name:AVAudioSessionInterruptionNotification object:nil];
        AVAudioSession* audioSession = [AVAudioSession sharedInstance];
        NSError * error;
        //I got the address of error and can change is var
        [audioSession setActive:YES error:&error];
        
        if (error != nil) {
            //STOP
        }
        [audioSession setCategory:AVAudioSessionCategoryPlayback error:&error];
        if (error != nil) {
            //STOP
        }
        NSString * filePath = [[NSBundle mainBundle] pathForResource:@"Developers" ofType:@"mp3"];
        NSData * fileData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
        if (error != nil) {
            //STOP
        }
        audioPlayer = [[AVAudioPlayer  alloc] initWithData:fileData fileTypeHint:@"mp3" error:&error];
        if (error != nil) {
            //STOP
        }
        audioPlayer.delegate = self;
        if([audioPlayer prepareToPlay] && [audioPlayer play]){
            //now audio is playing
        }
        
        
    });
    return YES;
}
-(void)handleInterruption:(NSNotification*)notification{
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
