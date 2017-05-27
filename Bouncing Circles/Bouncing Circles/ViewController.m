//
//  ViewController.m
//  Bouncing Circles
//
//  Created by Juda Cossa on 19/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"
#import "Pig.h"

@implementation ViewController
{
    UIButton * btnAdd;
    NSMutableArray<Pig*> * pigs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    pigs = [NSMutableArray arrayWithObject:[[Pig alloc] initWithStartingX: 29.5
                               andStartingY:38.3 andStartingVelocityX: 2.3 andStartingVelocityY: 1.14]];
    [self.view addSubview:pigs[0]];
    
    btnAdd = [UIButton buttonWithType:UIButtonTypeSystem];
    btnAdd.frame = CGRectMake(10, self.view.frame.size.height - 45, 200, 30);
    [btnAdd setTitle:@"add" forState:UIControlStateNormal];
    [self.view addSubview:btnAdd];
    
    [self draw];
//    imgPig = [UIImage imageNamed:@"pig"];
//    imgView.image = imgPig;
//    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, side*2, side*2)];
//    
//    imgView.contentMode = UIViewContentModeScaleToFill;
//    [self.view addSubview:imgView];
//    x = 29;
//    y = 30;
//    velocityX = 2.15;
//    velocityY = 1.25;
   
}
-(void) btnAdd:(UIButton*)sender{
    Pig * pig = [[Pig alloc] initWithStartingX:29.5 andStartingY:38.3 andStartingVelocityX:2.3 andStartingVelocityY:1.14];
    [pigs addObject:pig];
    [self.view addSubview:pig];
}
-(void)draw{
    
    for(int i = 0; i < pigs.count; i++)
        [pigs[i] move];
    
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
