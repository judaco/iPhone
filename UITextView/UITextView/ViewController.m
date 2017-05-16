//
//  ViewController.m
//  UITextView
//
//  Created by Juda Cossa on 16/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UITextView * textView;
    CGFloat x;
    CGFloat y;
    CGFloat width;
    CGFloat bottomMargin;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    x = 0;
    y = 30;
    bottomMargin = 35;
    width = self.view.frame.size.width;
    textView = [[UITextView alloc] initWithFrame:CGRectMake( x, y, width, self.view.frame.size.height - bottomMargin)];
    textView.text = @"some text ...";
    //textView.center = self.view.center;
    [self.view addSubview:textView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"handleKeyboardDidShow") name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"handleKeyboardDidHide") name:UIKeyboardDidHideNotification object:nil];
    
}
-(void) removeObserver{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) handleKeyboardDidShow:(NSNotification *) notification{
    NSValue * value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect = CGRectZero;
    [value getValue:&keyboardRect];
    
    NSLog(@"keyboard did show %f", keyboardRect.size.height);
    
    textView.frame = CGRectMake(x, y, width, self.view.frame.size.height - bottomMargin - keyboardRect.size.height);
}
-(void) handleKeyboardDidHide:(NSNotification *) noftification{
    NSLog(@"keyboard did hide");
    
    textView.frame = CGRectMake(x, y, width, self.view.frame.size.height - bottomMargin);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
