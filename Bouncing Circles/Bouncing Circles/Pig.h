//
//  Pig.h
//  Bouncing Circles
//
//  Created by Juda Cossa on 27/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pig : UIImageView

-(instancetype)initWithStartingX:(CGFloat) startingX andStartingY:(CGFloat) startingY andStartingVelocityX:(CGFloat) startingVelocityX andStartingVelocityY:(CGFloat) startingVelocityY;

-(void)move;

@end
