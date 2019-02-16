//
//  PSButtonShapeNode.m
//  MCPiSim
//
//  Created by Philipp Schunker on 16.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import "PSButtonShapeNode.h"

@implementation PSButtonShapeNode

- (instancetype)init{
    self = [super init];
    if(self){
        self.enabled = NO;
    }
    return self;
}

+ (instancetype)buttonWithTitle:(NSString *)title color:(SKColor *)color pressedColor:(SKColor *)pressedColor{
    PSButtonShapeNode *node = [super shapeNodeWithRect:CGRectMake(0, 0, 100, 44) cornerRadius:10];
    if(node){
        NSLog(@"test");
        node.strokeColor = color;
        node.fillColor = color;
        node.glowWidth = 1;
        node.enabled = NO;
    }
    return node;
}

- (NSString *)description{
    NSString *strDescription = [NSString stringWithFormat:@"<PSButtonShapeNode x: %f y: %f>",self.frame.origin.x, self.frame.origin.y];
    strDescription = [strDescription stringByAppendingString:@" subclass of "];
    strDescription = [strDescription stringByAppendingString:[super description]];
    return strDescription;
}

@end
