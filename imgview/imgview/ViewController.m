//
//  ViewController.m
//  imgview
//
//  Created by Juda Cossa on 18/04/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView * imageView;//the container of the image
    UIImage * image;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    image = [UIImage imageNamed:@"zebra"];
    //imageView = [[UIImageView alloc] initWithImage:image];
    imageView = [[UIImageView alloc] initWithFrame:self.view.frame];//I define his points, in order to define on which frame I'd like to show my image
    imageView.image = image;//define which image I would like to show on the screen
    //self.view;//UIView the class, the "view" is the main view of the ViewController
    //imageView.center = self.view.center;//center is a field of imageView from CGPoint, which it's a point on the screen, and each view has a center
    imageView.contentMode = UIViewContentModeScaleAspectFit;//change the size of the image - aspectFit (relative to the h or the w) and AspectFill (enlarge the image until the max of the image itself)
    [self.view addSubview:imageView];
    
    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
    @end
