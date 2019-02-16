//
//  PSButtonShapeNode.h
//  MCPiSim
//
//  Created by Philipp Schunker on 16.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PSButtonShapeNode : SKShapeNode

@property (nonatomic, assign) BOOL enabled;
@property (nonatomic) BOOL selected;

@property (nonatomic, readonly, strong) SKLabelNode *title;

+ (instancetype)buttonWithTitle:(NSString *)title color:(SKColor *)color pressedColor:(SKColor *)pressedColor;

@end

NS_ASSUME_NONNULL_END
