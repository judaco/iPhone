//
//  ViewController.m
//  UISwitch (CheckBox)
//
//  Created by Juda Cossa on 15/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UISwitch * mSwitch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    mSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    [self.view addSubview:mSwitch];
    [mSwitch setOn:YES animated:NO];
    
    [mSwitch addTarget:self action:NSSelectorFromString(@"switchChanged:") forControlEvents:UIControlEventValueChanged];
    mSwitch.tintColor = [UIColor redColor];
    mSwitch.onTintColor = [UIColor greenColor];
    mSwitch.thumbTintColor = [UIColor blueColor];
}

-(void)switchChanged: (UISwitch*) sender{
    if (sender == mSwitch) {
        //true
    }
    if (sender.on) {
        NSLog(@"switch is on");
    }else{
        NSLog(@"switch is off");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
