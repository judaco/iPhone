//
//  ViewController.m
//  DatePickerView
//
//  Created by Juda Cossa on 06/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIDatePicker * datePicker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    datePicker.center = self.view.center;
    [self.view addSubview:datePicker];
    
    [datePicker addTarget:self action:NSSelectorFromString(@"datePickerDateChanged:") forControlEvents:UIControlEventValueChanged];
    
    NSTimeInterval oneYearTime = 365 * 24 * 60 * 60;
    NSDate * today = [[NSDate alloc]init];
    NSDate * oneYearFromToday = [today dateByAddingTimeInterval:oneYearTime];
    datePicker.minimumDate = today;
    datePicker.maximumDate = oneYearFromToday;
}

-(void) datePickerDateChanged:(UIDatePicker *) sender{
    NSDate * selectedDate = datePicker.date;
    NSLog(@"date=%@", selectedDate);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
