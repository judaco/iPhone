//
//  ViewController.m
//  Gestures - Tap (click)
//
//  Created by Juda Cossa on 31/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UITapGestureRecognizer * tapRecognizer;
    UIImageView * imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage * image = [UIImage imageNamed:@"img1"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:NSSelectorFromString(@"handleTap:")];
    [imageView addGestureRecognizer:tapRecognizer];
}
-(void)handleTap:(UITapGestureRecognizer*)sender{
    NSLog(@"tap");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
