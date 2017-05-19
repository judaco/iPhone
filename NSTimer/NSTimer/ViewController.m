//
//  ViewController.m
//  NSTimer
//
//  Created by Juda Cossa on 19/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSTimer * timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:NSSelectorFromString(@"tick:") userInfo:nil repeats:YES];
    //[timer invalidate];
    //timer = nil;
}
-(void)tick:(NSTimer *) sender{
    NSLog(@"tick");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
