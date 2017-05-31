//
//  ViewController.m
//  Gestures - Swipe
//
//  Created by Juda Cossa on 31/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UISwipeGestureRecognizer * swipeRecognizer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:NSSelectorFromString(@"handleSwipes:")];
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeRecognizer.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:swipeRecognizer];
}
-(void)handleSwipes:(UISwipeGestureRecognizer *)sender{
    NSLog(@"swipe left");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
