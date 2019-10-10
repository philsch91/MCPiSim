//
//  PSMainScene.h
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CircleShapeNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainScene : SKScene

@property (nonatomic, strong) SKShapeNode *squareShapeNode;
@property (nonatomic, strong) SKShapeNode *circleShapeNode;
@property (nonatomic, assign) CGRect squareRect;

@property (nonatomic, strong) SKLabelNode *piLabelNode;

//+(instancetype)scene:(CGSize)size;
-(void)addPoint:(double)x y:(double)y color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
