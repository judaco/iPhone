//
//  ViewController.m
//  Gestures - Long Press
//
//  Created by Juda Cossa on 31/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIView * blueBox;
    UILongPressGestureRecognizer * longPressRecognizer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    blueBox = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    blueBox.backgroundColor = [UIColor redColor];
    [self.view addSubview:blueBox];
    
    longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:NSSelectorFromString(@"handleLongPress:")];
    longPressRecognizer.numberOfTouchesRequired = 2;
    longPressRecognizer.allowableMovement = 100;//move max 100 pixels
    longPressRecognizer.minimumPressDuration = 1;//touch min 1 second
    [self.view addGestureRecognizer:longPressRecognizer];
    
}
-(void)handleLongPress:(UILongPressGestureRecognizer*)sender{
    NSLog(@"long press");
    
    if (sender.numberOfTouches == 2) {
        CGPoint point1 = [sender locationOfTouch:0 inView:self.view];
        CGPoint point2 = [sender locationOfTouch:1 inView:self.view];
        CGPoint middle = CGPointMake((point1.x + point2.x)/2, (point1.y + point2.y/2));
        blueBox.center = middle;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
