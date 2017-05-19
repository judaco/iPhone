//
//  ViewController.m
//  MyProgressView
//
//  Created by Juda Cossa on 19/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"
#import "MyProgressView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    MyProgressView * myProgressView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    myProgressView = [[MyProgressView alloc] initWithFrame:CGRectMake(0, 0, 300, 10)];
    [myProgressView setProgress:0.2];
    myProgressView.center = self.view.center;
    [self.view addSubview:myProgressView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
