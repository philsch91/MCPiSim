//
//  ViewController.h
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

#import <MonteCarloKit/MonteCarloKit.h>
#import <PSSpriteKitUtils/PSSpriteKitUtils.h>

#import "MainScene.h"

@interface MainViewController : UIViewController

@property (nonatomic, strong) MainScene *mainScene;
@property (nonatomic, strong) PSButtonShapeNode *startButtonNode;
@property (nonatomic, strong) PSButtonShapeNode *resetButtonNode;

@property (nonatomic, strong) MCState *piState;
@property (nonatomic, assign) BOOL stopFlag;

@end

