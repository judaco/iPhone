//
//  ViewController.m
//  UIProgressView
//
//  Created by Juda Cossa on 19/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIProgressView * progressView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    progressView.center = self.view.center;
    progressView.progress = 0.5;
    progressView.trackTintColor = [UIColor greenColor];
    progressView.tintColor = [UIColor blueColor];
    [self.view addSubview:progressView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
