//
//  ViewController.m
//  UIWebView
//
//  Created by Juda Cossa on 16/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    WKWebView * webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKPreferences * prefrences = [[WKPreferences alloc] init];
    prefrences.javaScriptEnabled = YES;
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc] init];
    configuration.preferences = prefrences;
    
    webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height - 35) configuration:configuration];
    NSURL * url = [[NSURL alloc] initWithString:@"http://www.cnn.com"];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    webView.navigationDelegate = self;
    
}

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
