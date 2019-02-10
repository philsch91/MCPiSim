//
//  PSSpriteShapeNode.h
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PSSpriteShapeNode : SKShapeNode

-(instancetype)init;
+(instancetype)shapeNodeWithCircleOfRadius:(CGFloat)radius AndColor:(SKColor *)color;

@end

NS_ASSUME_NONNULL_END
