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

@property (nonatomic) BOOL enabled;
@property (nonatomic) BOOL selected;
@property (nonatomic, strong) SKColor *color;
@property (nonatomic, strong) SKColor *pressedColor;

@property (nonatomic, strong) SKLabelNode *text;

+ (instancetype)buttonWithText:(NSString *)text color:(SKColor *)color pressedColor:(SKColor *)pressedColor;

@end

NS_ASSUME_NONNULL_END
