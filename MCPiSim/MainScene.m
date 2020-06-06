//
//  PSMainScene.m
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene

/*
+(instancetype)scene:(CGSize)size{
    PSMainScene *scene = [super sceneWithSize:size];
    return scene;
}*/

-(void)didMoveToView:(SKView *)view{
    [super didMoveToView:view];
    [self addSquare];
    [self addCircle];
    
    SKLabelNode *piLabelNode = [SKLabelNode labelNodeWithText:@"0.0"];
    //CGPoint squareShapeNodeCenter = self.squareShapeNode.position;
    //NSLog(@"x: %f",squareShapeNodeCenter.x);
    //NSLog(@"y: %f",squareShapeNodeCenter.y);
    
    piLabelNode.position = CGPointMake(self.scene.frame.size.width/2, self.squareShapeNode.position.y+self.squareShapeNode.frame.size.height-(piLabelNode.frame.size.height*2));
    self.piLabelNode = piLabelNode;
    [self.scene addChild:self.piLabelNode];
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

-(void)addNode:(double)x y:(double)y color:(UIColor *)color{
    //NSLog(@"_squareShapeNode.position.x: %g",_squareShapeNode.position.x);
    NSLog(@"_squareShapeNode.frame.origin.x: %g", _squareShapeNode.frame.origin.x);
    NSLog(@"_squareShapeNode.frame.size.width: %g", _squareShapeNode.frame.size.width);
    
    x += _squareRect.origin.x + _squareRect.size.width/2;
    y += _squareRect.origin.y + _squareRect.size.height/2;
    
    SKShapeNode *node = [CircleShapeNode shapeNodeWithCircleOfRadius:1 AndColor:color];
    node.position = CGPointMake(x, y);
    [_squareShapeNode addChild:node];
}

@end
