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

+ (instancetype)buttonWithText:(NSString *)text{
    PSButtonShapeNode *node = [super shapeNodeWithRect:CGRectMake(0, 0, 100, 44) cornerRadius:10];
    if(node){
        node.text = [SKLabelNode labelNodeWithText:text];
        [node addChild:node.text];
        node.text.position = node.position;
        //[node.text setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [node.text setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
        node.text.fontName = [[UIFont systemFontOfSize:[UIFont buttonFontSize]] fontName];
        node.text.fontSize = [UIFont buttonFontSize];
        node.text.color = [UIColor whiteColor];
        node.color = [UIColor colorWithRed:0.0f/255.0f green:122.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
        node.pressedColor = [UIColor colorWithRed:50.0f/255.0f green:200.0f/255.0f blue:250.0f/255.0f alpha:1.0f];
        node.strokeColor = node.color;
        node.fillColor = node.color;
        node.glowWidth = 1;
        node.enabled = NO;
    }
    return node;
}

+ (instancetype)buttonWithText:(NSString *)text color:(SKColor *)color pressedColor:(SKColor *)pressedColor{
    PSButtonShapeNode *node = [super shapeNodeWithRect:CGRectMake(0, 0, 100, 44) cornerRadius:10];
    if(node){
        node.text = [SKLabelNode labelNodeWithText:text];
        node.text.position = node.position;
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

-(void)setButtonAction:(NSObject *)target selector:(SEL)selector{
    self.target = target;
    self.selector = selector;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.parent];
    
    if(![self enabled]){
        return;
    }
    
    [self setSelected:NO];
    if (CGRectContainsPoint(self.frame, touchPoint) && [self.target respondsToSelector:self.selector]) {
        //objc_msgSend(_targetTouchUpInside, _actionTouchUpInside);
        [[UIApplication sharedApplication] sendAction:self.selector to:self.target from:self forEvent:nil];
    }
    
    //objc_msgSend(_targetTouchUp, _actionTouchUp);
}

- (NSString *)description{
    NSString *strDescription = [NSString stringWithFormat:@"<%@ text:%@ color:%@ pressedColor:%@>",[self class], self.text, self.color, self.pressedColor];
    strDescription = [strDescription stringByAppendingString:@" subclass of "];
    strDescription = [strDescription stringByAppendingString:[super description]];
    return strDescription;
}

@end
