//
//  ViewController.m
//  ViewControllers Navigation
//
//  Created by Juda Cossa on 25/04/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UILabel * lblTitle;
    UIButton * btnGoTo2;
    UIButton * btnGoTo3;
    ViewController2 * viewController2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    lblTitle.center = CGPointMake(self.view.center.x, 100);
    lblTitle.text = @"View Controller 1";
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblTitle];
    
    
    btnGoTo2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btnGoTo2.frame = CGRectMake((self.view.frame.size.width-150*2-10)/2, lblTitle.frame.origin.y + 200, 150, 30);
    [btnGoTo2 setTitle:@"go to 2" forState:UIControlStateNormal];
    [btnGoTo2 addTarget:self action:NSSelectorFromString(@"btnGoTo2:") forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGoTo2];
    
    btnGoTo3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btnGoTo3.frame = CGRectMake(btnGoTo2.frame.origin.x + btnGoTo2.frame.size.width + 10, lblTitle.frame.origin.y + 200, 150, 30);
    [btnGoTo3 setTitle:@"go to 3" forState:UIControlStateNormal];
    [btnGoTo3 addTarget:self action:NSSelectorFromString(@"btnGoTo3:") forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGoTo3];

    
}
-(void)goToViewController:(int)which{
    if(viewController2==nil)
        viewController2 = [[ViewController2 alloc] init];
    viewController2.shouldGoTo = which;
    [self presentViewController:viewController2 animated:YES completion:nil];
}
-(void)btnGoTo2:(UIButton*)sender{
    [self goToViewController:2];
    
}
-(void)btnGoTo3:(UIButton*)sender{
    [self goToViewController:3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
