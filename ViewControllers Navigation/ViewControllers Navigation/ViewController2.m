//
//  ViewController2.m
//  ViewControllers Navigation
//
//  Created by Juda Cossa on 25/04/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@implementation ViewController2
{
    UILabel * lblTitle;
    UIButton * btnGoTo1;
    UIButton * btnGoTo3;
    ViewController3 * viewController3;
}

@synthesize shouldGoTo;
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"in viewDidLoad of 2 %i", shouldGoTo);
    
    lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    lblTitle.center = CGPointMake(self.view.center.x, 100);
    lblTitle.text = @"View Controller 2";
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblTitle];
    
    
    btnGoTo1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btnGoTo1.frame = CGRectMake((self.view.frame.size.width-150*2-10)/2, lblTitle.frame.origin.y + 200, 150, 30);
    [btnGoTo1 setTitle:@"go to 1" forState:UIControlStateNormal];
    [btnGoTo1 addTarget:self action:NSSelectorFromString(@"btnGoTo1:") forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGoTo1];
    
    btnGoTo3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btnGoTo3.frame = CGRectMake(btnGoTo1.frame.origin.x + btnGoTo1.frame.size.width + 10, lblTitle.frame.origin.y + 200, 150, 30);
    [btnGoTo3 setTitle:@"go to 3" forState:UIControlStateNormal];
    [btnGoTo3 addTarget:self action:NSSelectorFromString(@"btnGoTo3:") forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGoTo3];
    
    
}

-(void)btnGoTo1:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)btnGoTo3:(UIButton*)sender{
    [self goTo3];
}

-(void)goTo3{
    if(viewController3 == nil){
        viewController3 = [[ViewController3 alloc] init];
        viewController3.viewController2 = self;
    }
    [self presentViewController:viewController3 animated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"in viewDidAppear of 2 %i", shouldGoTo);
    if(shouldGoTo == 1)
        [self dismissViewControllerAnimated:YES completion:nil];
    else if(shouldGoTo == 3)
        [self goTo3];
}

@end
