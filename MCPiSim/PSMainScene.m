//
//  PSMainScene.m
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import "PSMainScene.h"

@implementation PSMainScene

/*
+(instancetype)scene:(CGSize)size{
    PSMainScene *scene = [super sceneWithSize:size];
    return scene;
}*/

-(void)didMoveToView:(SKView *)view{
    [super didMoveToView:view];
    [self addSquare];
    [self addCircle];
}

-(void)addSquare{
    double offset = 50;
    double edgeLength = self.scene.frame.size.width - offset;
    _squareRect = CGRectMake((self.scene.frame.origin.x + offset)/2,
                             (self.scene.frame.origin.y + edgeLength),
                             edgeLength, edgeLength);
    _squareShapeNode = [SKShapeNode shapeNodeWithRect:_squareRect];
    _squareShapeNode.lineWidth = 6;
    [self.scene addChild:_squareShapeNode];
}

-(void)addCircle{
    _circleShapeNode = [SKShapeNode shapeNodeWithEllipseInRect:_squareRect];
    _circleShapeNode.lineWidth = 3;
    [self.scene addChild:_circleShapeNode];
}

@end
