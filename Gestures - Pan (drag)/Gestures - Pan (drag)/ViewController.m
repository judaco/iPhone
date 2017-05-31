//
//  ViewController.m
//  Gestures - Pan (drag)
//
//  Created by Juda Cossa on 31/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UILabel * label;
    UIPanGestureRecognizer * panRecognizer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 60)];
    label.text = @"Juda is here";
    label.backgroundColor = [UIColor greenColor];
    label.textColor = [UIColor whiteColor];
    label.center = self.view.center;
    label.userInteractionEnabled = YES;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:NSSelectorFromString(@"handlePan:")];
    [label addGestureRecognizer:panRecognizer];
    panRecognizer.minimumNumberOfTouches = 1;
    panRecognizer.maximumNumberOfTouches = 1;
}
-(void)handlePan:(UIPanGestureRecognizer *)sender{
    if (sender.state != UIGestureRecognizerStateEnded && sender.state != UIGestureRecognizerStateFailed) {
        CGPoint location = [sender locationInView:self.view];
        label.center = location;//same as - sender.center.label = location
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
