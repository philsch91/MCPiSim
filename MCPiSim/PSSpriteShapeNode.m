//
//  PSSpriteShapeNode.m
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import "PSSpriteShapeNode.h"

@implementation PSSpriteShapeNode

- (instancetype)init{
    self = [super init];
    //if(self){}
    return self;
}

+(instancetype)shapeNodeWithCircleOfRadius:(CGFloat)radius AndColor:(SKColor *)color{
    //SKShapeNode *shapeNode = [SKShapeNode shapeNodeWithCircleOfRadius:radius];
    PSSpriteShapeNode *shapeNode = [super shapeNodeWithCircleOfRadius:radius];
    shapeNode.strokeColor = color;
    shapeNode.fillColor = color;
    shapeNode.glowWidth = 1;
    return shapeNode;
}

@end
