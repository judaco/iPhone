//
//  ViewController.m
//  My Date Picker
//
//  Created by Juda Cossa on 06/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"
#import "Calendar.h"
#import "PickerView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    Calendar * calendar;
    UIPickerView * pickerView;
    PickerView * delegate;
    UIButton * btnShowDate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    calendar = [[Calendar alloc] init];
    delegate = [[PickerView alloc] init];
    delegate.calendar = calendar;
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    pickerView.center = self.view.center;
    pickerView.delegate = delegate;
    pickerView.dataSource = delegate;
    [self.view addSubview:pickerView];
    
    btnShowDate = [UIButton buttonWithType:UIButtonTypeSystem];
    btnShowDate.frame = CGRectMake((self.view.frame.size.width-100)/2, pickerView.frame.origin.y + pickerView.frame.size.height + 10, 100, 30);
    [btnShowDate setTitle:@"show date" forState:UIControlStateNormal];
    [btnShowDate addTarget:self action:NSSelectorFromString(@"btnShowDate:") forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnShowDate];
}

-(void)btnShowDate:(UIButton*)sender{
    int month = (int)[pickerView selectedRowInComponent:0];
    int day = (int)[pickerView selectedRowInComponent:1];
    NSString * dateAsString = [calendar dayToStringOfMonth:month day:day];
    //NSLog(@"%@", dateAsString);
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"date is" message:dateAsString preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * actionOk = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:actionOk];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
