//
//  MainViewController.h
//  MCPiSim
//
//  Created by Philipp Schunker on 06.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import <MonteCarloKit/MonteCarloKit.h>
#import "RectangleView.h"
#import "CircleView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) UILabel *piLabel;

@property (nonatomic, strong) RectangleView *squareView;
@property (nonatomic, strong) CircleView *circleView;

@property (nonatomic, strong) MCState *piState;
@property (nonatomic, assign) BOOL stopFlag;

@end

NS_ASSUME_NONNULL_END
