//
//  RectangleView.m
//  MCPiSim
//
//  Created by Philipp Schunker on 06.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

#import "RectangleView.h"

@implementation RectangleView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect boundsRect = self.bounds;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw background
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    //CGContextSetFillColorWithColor(context, [[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor);
    //CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.0);   //transparent color
    CGContextFillRect(context, boundsRect);
    //CGContextFillRect(context, rect);
    
    // Draw the window 'frame'
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    //CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
    CGContextSetLineWidth(context, 10);
    //CGContextStrokeRect(context, self.maskRect);
    CGContextStrokeRect(context, boundsRect);    //draw the border
    //CGContextStrokeRect(context, rect);          //draw the border

    // Make the window transparent
    //CGContextSetBlendMode(context, kCGBlendModeClear);
    //CGContextFillRect(context, self.maskRect);
    //CGContextFillRect(context, self.maskView.frame);
}

@end
