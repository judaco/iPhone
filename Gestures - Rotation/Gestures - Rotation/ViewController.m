//
//  ViewController.m
//  Gestures - Rotation
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
    UIRotationGestureRecognizer * rotationRecognizer;
    CGFloat angle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    label = [[UILabel alloc] init];
    label.text = @"Juda is here";
    [label sizeToFit];
    label.center = self.view.center;
    [self.view addSubview:label];
    
    rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:NSSelectorFromString(@"handleRotations:")];
    [self.view addGestureRecognizer:rotationRecognizer];
}
-(void)handleRotations:(UIRotationGestureRecognizer*)sender{
    label.transform = CGAffineTransformMakeRotation(angle + sender.rotation);
    if (sender.state == UIGestureRecognizerStateEnded) {
        angle += sender.rotation;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
