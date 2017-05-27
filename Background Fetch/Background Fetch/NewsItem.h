//
//  NewsItem.h
//  Background Fetch
//
//  Created by Juda Cossa on 27/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsItem : NSObject

@property NSDate * date;
@property NSString * text;

-(instancetype)initWithDate:(NSDate*)date andText:(NSString*)text;

@end
