//
//  ViewController.m
//  JSON Serialization
//
//  Created by Juda Cossa on 06/06/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    NSDictionary<NSString*, NSString*> * dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"value1", @"key1", [NSArray arrayWithObjects:@"Juda", @"Shalev", @"Regev", @"Eliran", nil], @"key2", nil];
    //    NSString * s = (NSString*)dictionary[@"key1"];
    //    NSLog(@"value of s%@", s);
    //    NSArray * array = (NSArray*)dictionary[@"key2"];
    //    NSLog(@"first element %@", array[0]);
    //}
    
    NSDictionary * person = [[NSDictionary alloc] initWithObjectsAndKeys:@"Juda", @"First Name", @"Cossa", @"Last Name", [NSNumber numberWithInt:30], @"Age", [NSArray arrayWithObjects:@"Shalev", @"Regev", nil], @"Friends", nil];
    
    NSError * error = nil;
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:person options:NSJSONWritingPrettyPrinted error:&error];
    if (error == nil) {
        NSString * dataAsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", dataAsString);
    }
    
    id jsonObject = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error == nil) {
        NSDictionary<NSString*, NSObject*> * dictionary2 = (NSDictionary*) jsonObject;
        NSLog(@"%@", dictionary2[@"First Name"]);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
