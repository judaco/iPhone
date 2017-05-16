//
//  ViewController.m
//  UIScrollView
//
//  Created by Juda Cossa on 16/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImage * img1;
    UIImageView * imageView;
    UIScrollView * scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    img1 = [UIImage imageNamed:@"img1"];
    imageView = [[UIImageView alloc] initWithImage:img1];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width * 2, self.view.frame.size.height * 2);
    imageView.contentMode = UIViewContentModeScaleToFill;
    
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [scrollView addSubview:imageView];
    scrollView.contentSize = imageView.frame.size;
    [self.view addSubview:imageView];
    scrollView.delegate = self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    scrollView.alpha = 0.5;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    scrollView.alpha = 1.0;
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    scrollView.alpha = 1.0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
