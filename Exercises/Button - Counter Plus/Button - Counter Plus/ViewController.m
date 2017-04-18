//
//  ViewController.m
//  Button - Counter Plus
//
//  Created by Juda Cossa on 18/04/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIButton * btn;
    UILabel * label;
    int counter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 100, 100, 30)];
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.center = CGPointMake(self.view.center.x, 150);
    label.text = [[NSString alloc] initWithFormat:@"%i", counter];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor yellowColor];
    
    
    [self.view addSubview:label];
    btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y + label.frame.size.height + 5, label.frame.size.width, label.frame.size.height);
    [btn setTitle:@"increase" forState:UIControlStateNormal];
    //[btn addTarget:self action:NSSelectorFromString(@"buttonTouchDown:") forControlEvents:UIControlEventTouchDown];
    [btn addTarget: self action: NSSelectorFromString(@"btnIncrease:") forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: btn];
    
}

-(void)btnIncrease: (UIButton *) sender {
    counter++;
    label.text = [[NSString alloc] initWithFormat:@"%i", counter];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
