//
//  PickerViewDelegate.m
//  My Date Picker
//
//  Created by Juda Cossa on 06/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "PickerView.h"

@implementation PickerView

@synthesize calendar;

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0){
        return [calendar daysInMonth].count;
    }else{
        int selectedMonth = (int)[pickerView selectedRowInComponent:0];
        return [calendar daysInMonth][selectedMonth].intValue;
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0){
        [pickerView reloadComponent:1];
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0){
        return [calendar monthNames][row];
    }else{
        return [[NSString alloc] initWithFormat:@"%li", (row+1)];
    }
}

@end
