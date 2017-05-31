//
//  ViewController.m
//  Location Changes in Background
//
//  Created by Juda Cossa on 27/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@end

@implementation ViewController
{
    CLLocationManager * locationManager;
    BOOL isInBackground;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    //[locationManager startUpdatingLocation];
}
-(void)viewDidAppear:(BOOL)animated{
    
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusAuthorizedAlways:
            NSLog(@"always");
            [locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [locationManager startUpdatingLocation];
            NSLog(@"when in use");
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"denied");
            break;
        case kCLAuthorizationStatusNotDetermined:
            [locationManager requestAlwaysAuthorization];
            NSLog(@"not determined");
            break;
        case kCLAuthorizationStatusRestricted:
            NSLog(@"restricted");
            break;
            
        default:
            break;
    }
}


-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
            NSLog(@"always");
            [locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"when in use");
            [locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"denied");
            break;
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"always");
            break;
        case kCLAuthorizationStatusRestricted:
            NSLog(@"always");
            break;
            
        default:
            break;
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    if(isInBackground){
        //do NOT do heavy stuff, don't do UI stuff
    }else{
        //go crazy and do heavy stuff
    }
    if(locations.count > 0){
        NSLog(@"%li %f %f", locations.count, locations[0].coordinate.latitude, locations[0].coordinate.longitude);
    }else{
        NSLog(@"empty array");
    }
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"error: %@", [error description]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
