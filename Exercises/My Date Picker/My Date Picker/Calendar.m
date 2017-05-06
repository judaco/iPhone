//
//  Calendar.m
//  My Date Picker
//
//  Created by Juda Cossa on 06/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar
{
    NSArray<NSString*> * monthNames;
    NSArray<NSNumber*> * daysInMonth;
    NSArray<NSString*> * daysOfWeek;
    int initialDay;
}

-(NSArray<NSString*> *)monthNames{
    return monthNames;
}

-(NSArray<NSNumber*> *)daysInMonth{
    return daysInMonth;
}

-(instancetype) init{
    self = [super init];
    if (self) {
        monthNames = [[NSArray alloc] initWithObjects:@"January", @"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December", nil];
        daysInMonth = [[NSArray alloc] initWithObjects:@31,@28,@31,@30,@31,@30,@31,@31,@30,@31,@30,@31, nil];
        daysOfWeek = [[NSArray alloc] initWithObjects:@"Sunday",@"Monday",@"Tuesday",@"Wednsday",@"Thursday",@"Friday",@"Saturday", nil];
    }
    return self;
}

-(NSString *)weekdayInYear:(int)dayInYear{
    return daysOfWeek[(initialDay = dayInYear - 1) % 7];
}

-(int)dayInYearInMonth:(int)month day:(int)day{
    int result = day;
    for (int i = 0; i < month; i++)
        result += daysInMonth[i].intValue;
        return result;
}
-(NSString *)dayToStringOfMonth:(int) month day: (int) day{
    int dayInYear = [self dayInYearInMonth: month day:day];
    return [[NSString alloc] initWithFormat:@"%@ %@ %i", [self weekdayInYear:dayInYear], monthNames[month], (day+1)];
}

@end
