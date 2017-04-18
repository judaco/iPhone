//
//  ViewController.m
//  Button Image
//
//  Created by Juda Cossa on 18/04/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIButton * button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //TODO - need to add the images
    UIImage * img1 = [UIImage imageNamed:@"img1"];
    UIImage * img2 = [UIImage imageNamed:@"img2"];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.center = self.view.center;
    
    [button setTitle:@"click me" forState:UIControlStateNormal];
    [button setTitle:@"clicked" forState:UIControlStateHighlighted];
    [button setTitleColor: [UIColor greenColor] forState:UIControlStateNormal];
    [button setBackgroundImage:img1 forState:UIControlStateNormal];
    [button setBackgroundImage:img2 forState:UIControlStateHighlighted];
    
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
