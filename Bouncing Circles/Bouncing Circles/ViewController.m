//
//  ViewController.m
//  Bouncing Circles
//
//  Created by Juda Cossa on 19/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

const CGFloat side = 50;

@interface ViewController ()

@end

@implementation ViewController
{
    UIImage * imgPig;
    UIImageView * imgView;
    CGFloat x, y;
    CGFloat velocityX, velocityY;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    imgPig = [UIImage imageNamed:@"pig"];
    imgView.image = imgPig;
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, side*2, side*2)];
    
    imgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgView];
    x = 29;
    y = 30;
    velocityX = 2.15;
    velocityY = 1.25;
    
    [self draw];
}
-(void)draw{
    
    x += velocityX;
    y += velocityY;
    
    if (x + side >= self.view.frame.size.width) {
        velocityX *= -1;
        x = self.view.frame.size.width - side;
    }
    if (x - side <= 0) {
        velocityX *= -1;
        x = side;
    }
    if (y + side >= self.view.frame.size.height) {
        velocityY *= -1;
        y = self.view.frame.size.height - side;
    }
    if (y  - side <= 0) {
        velocityY *= -1;
        y = side;
    }
    
    imgView.center = CGPointMake(x, y);
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC / 100);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [self draw];
    });
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
