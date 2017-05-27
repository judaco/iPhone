//
//  AppDelegate.m
//  Background Fetch
//
//  Created by Juda Cossa on 27/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    NSMutableArray<NewsItem*> * newsItems;
}

@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    newsItems = [NSMutableArray arrayWithObject:[[NewsItem alloc] initWithDate:[NSDate date] andText:@"News Item 1"]];
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    return YES;
}
-(NSMutableArray<NewsItem*> *)getNews{
    return newsItems;
}

-(BOOL)fetchNewsItem{
    NewsItem * newsItem = [[NewsItem alloc] initWithDate:[NSDate date] andText:[NSString stringWithFormat:@"News Item %lu", newsItems.count+1]];
    [newsItems addObject:newsItem];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"newNewsItem" object:nil];
    
    if (viewController != nil) {
        [viewController mivzak];
    }
    return YES;
}
-(void) application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    if ([self fetchNewsItem]) {
        completionHandler(UIBackgroundFetchResultNewData);
    }else{
        completionHandler(UIBackgroundFetchResultNoData);
    }
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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"broughtToForeground" object:nil];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
