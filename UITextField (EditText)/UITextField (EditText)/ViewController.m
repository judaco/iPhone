//
//  ViewController.m
//  UITextField (EditText)
//
//  Created by Juda Cossa on 16/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UITextField * textField;
    UILabel * lblCounter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.center = self.view.center;
    textField.text = @"initial text";
    //for hint
    //textField.placeholder = @"please insert a name";
    [self.view addSubview:textField];
    
    lblCounter = [[UILabel alloc] initWithFrame:CGRectMake(textField.frame.origin.x, textField.frame.origin.y - 50, textField.frame.size.width, 30)];
    [self.view addSubview:lblCounter];
    [self calculateLength:textField.text];
    textField.delegate = self;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //NSLog(@"%li %li %@", range.location, range.length, string);
    NSString * text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self calculateLength:text];
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

//when i get a string from user, I need to get the numbers of chars
-(void)calculateLength:(NSString *) text{
    NSString * label;
    unsigned long int length = [text lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    if (length == 1){
        label = @"character";
        //NSLog(@"%li charachter", length);
    }else{
        label = @"characters";
        //NSLog(@"%li charachters", length);
    }
    
    label = [[NSString alloc] initWithFormat:@"%li %@", length, label];
    lblCounter.text = label;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
