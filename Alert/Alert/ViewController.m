//
//  ViewController.m
//  Alert
//
//  Created by Juda Cossa on 25/04/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self alert:@"yalla bye"];
}

-(void)alert:(NSString*)msg{
    UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"alert" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDestructive handler:nil];
    [controller addAction:action];
    [self presentViewController:controller animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
