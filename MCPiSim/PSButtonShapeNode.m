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

+ (instancetype)buttonWithText:(NSString *)text color:(SKColor *)color pressedColor:(SKColor *)pressedColor{
    PSButtonShapeNode *node = [super shapeNodeWithRect:CGRectMake(0, 0, 100, 44) cornerRadius:10];
    if(node){
        node.text = [SKLabelNode labelNodeWithText:text];
        node.text.fontName = [[UIFont systemFontOfSize:[UIFont buttonFontSize]] fontName];
        node.text.fontSize = [UIFont buttonFontSize];
        node.color = color;
        node.pressedColor = pressedColor;
        node.strokeColor = node.color;
        node.fillColor = node.color;
        node.glowWidth = 1;
        node.enabled = NO;
    }
    return node;
}

- (NSString *)description{
    NSString *strDescription = [NSString stringWithFormat:@"<%@ text:%@ color:%@ pressedColor:%@>",[self class], self.text, self.color, self.pressedColor];
    strDescription = [strDescription stringByAppendingString:@" subclass of "];
    strDescription = [strDescription stringByAppendingString:[super description]];
    return strDescription;
}

@end
