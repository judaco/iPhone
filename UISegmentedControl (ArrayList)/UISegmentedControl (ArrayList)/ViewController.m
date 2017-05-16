//
//  ViewController.m
//  UISegmentedControl (ArrayList)
//
//  Created by Juda Cossa on 16/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UISegmentedControl * segmentControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //can create an array of several types, as NSString like the first examples, and also with UIImage
    //** Need to bring the image calls "angry_birds_small **
    NSArray * segments = [[NSArray alloc] initWithObjects:@"real estate",@"cars",@"yad2",@"jobs", [UIImage imageNamed:@"angry_birds_small"], nil];
    
    segmentControl = [[UISegmentedControl alloc] initWithItems:segments];
    //segmentControl.center = self.view.center;
    segmentControl.frame = CGRectMake(5, 30, self.view.frame.size.width - 20, 40);
    [self.view addSubview:segmentControl];
    
    [segmentControl addTarget:self action:NSSelectorFromString(@"segmentControlValueChanged:") forControlEvents:UIControlEventValueChanged];
    segmentControl.momentary = NO;
    
}

-(void)segmentControlValueChanged:(UISegmentedControl *) sender{
    if (sender == segmentControl){
        long int value = segmentControl.selectedSegmentIndex;
        NSLog(@"selected index %li", value);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
