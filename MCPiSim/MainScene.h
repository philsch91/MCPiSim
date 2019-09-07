//
//  PSMainScene.h
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainScene : SKScene

//+(instancetype)scene:(CGSize)size;

@property (nonatomic, strong) SKShapeNode *squareShapeNode;
@property (nonatomic, strong) SKShapeNode *circleShapeNode;
@property (nonatomic, assign) CGRect squareRect;

@property (nonatomic, strong) SKLabelNode *piLabelNode;

@end

NS_ASSUME_NONNULL_END
