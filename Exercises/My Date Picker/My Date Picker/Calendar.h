//
//  Calendar.h
//  My Date Picker
//
//  Created by Juda Cossa on 06/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Calendar : NSObject

-(NSString *)weekdayInYear:(int)dayInYear;
-(int)dayInYearInMonth:(int)month day:(int)day;
-(NSString*)dayToStringOfMonth:(int)month day:(int)day;
-(NSArray<NSString*>*)monthNames;
-(NSArray<NSNumber*>*)daysInMonth;

@end
