//
//  CircleView.m
//  MCPiSim
//
//  Created by Philipp Schunker on 07.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    ///CoreGraphics ObjC
    /*
    CGRect boundsRect = self.bounds;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //CGPoint center;
    //center.x = boundsRect.origin.x + boundsRect.size.width / 2.0;
    //center.y = boundsRect.origin.y + boundsRect.size.height / 2.0;
    //CGContextSaveGState(context);

    CGContextSetLineWidth(context, 10);
    CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor);
    //CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
    
    CGContextAddArc(context, self.center.x, self.center.y, round(self.frame.size.width) - 10, 0.0, M_PI*2, 1);
    CGContextStrokePath(context);
    */
    
    ///CoreGraphics Swift
    /*
    let context = UIGraphicsGetCurrentContext()
    let center = self.center
    let radius = (round(self.frame.size.width) - 10)
    context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI*2.0), clockwise: true)
    */
    
    if(_strokeColor == nil) {
        _strokeColor = [UIColor clearColor];
    }
    
    [self.strokeColor setStroke];
    //[[UIColor clearColor] setFill];
    [self.backgroundColor setFill];
    
    //NSLog(@"self.center.x %f",self.center.x);
    //NSLog(@"rect.center.x %f",rect.origin.x + rect.size.width / 2);
    
    NSLog(@"rect.size.width %f",rect.size.width);
    NSLog(@"rect.size.height %f",rect.size.height);
    
    rect.size.width -= self.lineWidth;
    rect.size.height -= self.lineWidth;
    
    NSLog(@"rect.size.width %f",rect.size.width);
    NSLog(@"rect.size.height %f",rect.size.height);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    path.lineWidth = self.lineWidth;
    [path stroke];
    [path fill];
}

@end
