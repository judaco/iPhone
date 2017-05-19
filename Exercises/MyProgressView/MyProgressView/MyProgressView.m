//
//  MyProgressView.m
//  MyProgressView
//
//  Created by Juda Cossa on 19/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "MyProgressView.h"

@implementation MyProgressView
{
    CGFloat _progress;
    UIView * completed;
}

-(instancetype)initWithFrame:(CGRect)frame{
    MyProgressView * myProgressView = [super initWithFrame:frame];
    if(myProgressView != nil){
        self.backgroundColor = [UIColor grayColor];
        completed = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, frame.size.height)];
        completed.backgroundColor = [UIColor blueColor];
        [self addSubview:completed];
    }
    return myProgressView;
}

-(CGFloat)getProgress{
    return _progress;
}

-(void)setProgress:(CGFloat)p{
    if(p<0 || p>1)
        return;
    _progress = p;
    completed.frame = CGRectMake(0, 0, self.frame.size.width * p, self.frame.size.height);
}

@end
