//
//  ViewController.m
//  Label
//
//  Created by Juda Cossa on 18/04/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

//
//  ViewController.m
//  Label
//
//  Created by hackeru on 05/04/2017.
//  Copyright © 2017 juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UILabel * label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 70)];
    label.text = @"Hi Juda, welcome on board";
    label.adjustsFontSizeToFitWidth = true;//fit my font size to the height and width of my frame
    label.textColor = [UIColor greenColor];//choosing a text color
    //    label.numberOfLines = 2;
    //    label.font = [UIFont boldSystemFontOfSize:14];
    //    label.lineBreakMode = NSLineBreakByClipping;//cutting my phrase by the font size which i defined
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
