//
//  ViewController.m
//  NSURLSession
//
//  Created by Juda Cossa on 31/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDataDelegate>

@end

@implementation ViewController
{
    NSMutableData * mutableData;
    NSURLSession * session;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Define a configuration
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 15.0; // after 15 seconds if the server is not responding disconnect the request
    session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURL * url = [NSURL URLWithString:@"http://www.uefa.com"];
    //bring data
    /*NSURLSessionDataTask * task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     //NSData is an array of bytes, these are the bytes of the response
     if (error == nil) {
     NSLog(@"data length: %li", data.length);
     NSString * dataAsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
     
     //NSLog(@"%i", [[NSThread currentThread] isMainThread]);
     //runs on global queue
     
     }else{
     NSLog(@"un grande casino %@", [error description]);
     }
     [session finishTasksAndInvalidate];//close the connection. like connection.close
     }];*/
    
    //this is POST
    //NSURLSessionDownloadTask * task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable //location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    //}];
    mutableData = [[NSMutableData alloc] init];
    NSURLSessionDataTask * task = [session dataTaskWithURL:url];
    [task resume];//starting the task itself
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    NSLog(@"did receive data");
    [mutableData appendData:data];
}
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    if (error == nil){
        NSString * dataAsString = [[NSString alloc] initWithData:mutableData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", dataAsString);
        NSLog(@"%i", [NSThread isMainThread]);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
