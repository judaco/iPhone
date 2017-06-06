//
//  ViewController.m
//  Http POST Request
//
//  Created by Juda Cossa on 06/06/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDataDelegate>

@end

@implementation ViewController
{
    NSURLSession * session;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 15.0;
    
    session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSString * stringToSendToServer = @"Ciao, come stai oggi?";
    NSData * dataToUpload = [stringToSendToServer dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL * url = [NSURL URLWithString:@"http://localhost:8080/MainServlet"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSURLSessionDataTask * task = [session uploadTaskWithRequest:request fromData:dataToUpload];
    [task resume];
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    NSLog(@"did receive data");
    NSString * string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", string);
}
//method which says that the session completed/finished
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    if (error == nil) {
        NSLog(@"did complete");
    }
    [session finishTasksAndInvalidate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
