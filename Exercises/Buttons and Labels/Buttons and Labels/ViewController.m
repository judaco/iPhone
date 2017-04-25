//
//  ViewController.m
//  Buttons and Labels
//
//  Created by Juda Cossa on 25/04/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    int num;
    UIButton * btnUp;
    UIButton * btnDown;
    UILabel * lblNum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    lblNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    lblNum.center = self.view.center;
    lblNum.textAlignment = NSTextAlignmentCenter;
    num = 0;
    lblNum.text = [NSString stringWithFormat:@"%i",num];
    [self.view addSubview:lblNum];
    btnUp = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnUp setTitle:@"+" forState:UIControlStateNormal];
    [btnUp addTarget:self action:NSSelectorFromString(@"btnUpClicked:") forControlEvents:UIControlEventTouchUpInside];
    
    int buttonWidth = 40;
    btnUp.frame = CGRectMake(lblNum.frame.origin.x + lblNum.frame.size.width + 5, lblNum.frame.origin.y, buttonWidth, 30);
    [self.view addSubview:btnUp];
    btnDown = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnDown setTitle:@"-" forState:UIControlStateNormal];
    [btnDown addTarget:self action:NSSelectorFromString(@"btnDownClicked:") forControlEvents:UIControlEventTouchUpInside];
    btnDown.frame = CGRectMake(lblNum.frame.origin.x -buttonWidth - 5, lblNum.frame.origin.y, buttonWidth, 30);
    [self.view addSubview:btnDown];
    
}
-(void)btnUpClicked:(UIButton*)sender{
    if(num < 10){
        num++;
        lblNum.text = [NSString stringWithFormat:@"%i",num];
    }
}

-(void)btnDownClicked:(UIButton*)sender{
    if(num > 0){
        num--;
        lblNum.text = [NSString stringWithFormat:@"%i",num];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
