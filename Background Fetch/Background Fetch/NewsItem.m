//
//  NewsItem.m
//  Background Fetch
//
//  Created by Juda Cossa on 27/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem

-(instancetype)initWithDate:(NSDate *)date andText:(NSString *)text{
    self = [super init];
    if (self != nil) {
        self.date = date;
        self.text = text;
    }
    return self;
}

@end
