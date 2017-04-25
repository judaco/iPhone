//
//  ViewController3.m
//  ViewControllers Navigation
//
//  Created by Juda Cossa on 25/04/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController3.h"

@implementation ViewController3
{
    UILabel * lblTitle;
    UIButton * btnGoTo1;
    UIButton * btnGoTo2;
    
}

@synthesize viewController2;

-(void)viewDidLoad{
    [super viewDidLoad];
    lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    lblTitle.center = CGPointMake(self.view.center.x, 100);
    lblTitle.text = @"View Controller 3";
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblTitle];
    
    
    btnGoTo2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btnGoTo2.frame = CGRectMake((self.view.frame.size.width-150*2-10)/2, lblTitle.frame.origin.y + 200, 150, 30);
    [btnGoTo2 setTitle:@"go to 2" forState:UIControlStateNormal];
    [btnGoTo2 addTarget:self action:NSSelectorFromString(@"btnGoTo2:") forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGoTo2];
    
    btnGoTo1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btnGoTo1.frame = CGRectMake(btnGoTo2.frame.origin.x + btnGoTo2.frame.size.width + 10, lblTitle.frame.origin.y + 200, 150, 30);
    [btnGoTo1 setTitle:@"go to 1" forState:UIControlStateNormal];
    [btnGoTo1 addTarget:self action:NSSelectorFromString(@"btnGoTo1:") forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGoTo1];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //    UIView * viewContainer = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 200, 300)];
    //    [self.view addSubview:viewContainer];
    //    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    //    label.text = @"bla bla";
    //    [viewContainer addSubview:label];
}

-(void)btnGoTo2:(UIButton*)sender{
    //ViewController2 * vc2 = (ViewController2*)self.presentingViewController;
    //vc2.shouldGoTo = 2;
    viewController2.shouldGoTo = 2;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)btnGoTo1:(UIButton*)sender{
    viewController2.shouldGoTo = 1;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
