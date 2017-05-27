//
//  Pig.m
//  Bouncing Circles
//
//  Created by Juda Cossa on 27/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "Pig.h"

const CGFloat side = 25;

@implementation Pig
{
    CGFloat x, y, velocityY, velocityX;
}

-(instancetype)initWithStartingX:(CGFloat) startingX andStartingY:(CGFloat) startingY andStartingVelocityX:(CGFloat) startingVelocityX andStartingVelocityY:(CGFloat) startingVelocityY{
    self = [super initWithFrame:CGRectMake(0, 0, side*2, side*2)];
    if(self != nil){
        x = startingX;
        y = startingY;
        velocityX = startingVelocityX;
        velocityY = startingVelocityY;
        self.image = [UIImage imageNamed:@"pig"];
        self.contentMode = UIViewContentModeScaleToFill;
    }
    return self;
}


-(void)move{
    x += velocityX;
    y += velocityY;
    if(x + side >= self.superview.frame.size.width){
        velocityX *= -1;
        x = self.superview.frame.size.width - side;
    }
    if(x - side <= 0){
        velocityX *= -1;
        x = side;
    }
    if(y + side + 50 >= self.superview.frame.size.height){
        velocityY *= -1;
        y = self.superview.frame.size.height - side - 50;
    }
    if(y - side <= 0){
        velocityY *= -1;
        y = side;
    }
    self.center = CGPointMake(x, y);
    
}

@end
