//
//  ViewController.m
//  UISlider
//
//  Created by Juda Cossa on 06/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UISlider * slider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    slider.center = self.view.center;
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50;
    [self.view addSubview:slider];
    
    [slider addTarget:self action:NSSelectorFromString(@"sliderChanged:") forControlEvents:UIControlEventValueChanged];
}
-(void) sliderChanged:(UISlider *) sender{
    NSLog(@"value=%i", (int)slider.value);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
