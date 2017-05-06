//
//  ViewController.m
//  UIPickerView
//
//  Created by Juda Cossa on 06/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIPickerView * picker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 10, 200, 300)];
    [self.view addSubview:picker];
    picker.dataSource = self;
    picker.delegate = self;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0)
        return 10;
    else
        return 20;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0)
        return [[NSString alloc] initWithFormat:@"row %li",(row+1)];
    else
        return [[NSString alloc] initWithFormat:@"row %li",(row+11)];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"row %li component %li", row, component);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
