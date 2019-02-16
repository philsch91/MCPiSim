//
//  PSMainScene.h
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PSMainScene : SKScene

//+(instancetype)scene:(CGSize)size;

@property (nonatomic, strong) SKShapeNode *squareShapeNode;
@property (nonatomic, strong) SKShapeNode *circleShapeNode;
@property (nonatomic, assign) CGRect squareRect;

@end

NS_ASSUME_NONNULL_END
