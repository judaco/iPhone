//
//  ViewController.m
//  GCD - Grand Central Dispatch
//
//  Created by Juda Cossa on 19/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    //this is a pointer, except the garbage collector, this is a weak pointer, and then the GC can demolish the object
    __weak UILabel * label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 100, 30)];
    [self.view addSubview:label];
    
    //execute in the global (async) thread
    dispatch_queue_t queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        int x = 0;
        for (int i =0; i < 100000;  i++) {
            for (int j = 0; j < 20000;  j++) {
                if( i%2 ){
                    x++;
                }else{
                    x--;
                }
            }
        }
        //NSLog(@"I am done!");
        //an async thread, prohibited!!!
        //label.text = @"�I am done.";
        //execute in the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            label.text = @"I am done";
        });
        
    });
    NSLog(@"done viewDidLoad");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
