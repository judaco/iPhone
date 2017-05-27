//
//  AppDelegate.h
//  Background Fetch
//
//  Created by Juda Cossa on 27/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property ViewController * viewController;

@property int mivzak;

-(NSMutableArray<NewsItem*>*)getNews;


@end

