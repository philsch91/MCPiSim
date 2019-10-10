//
//  ViewController.m
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGSize size = self.view.bounds.size;
    NSLog(@"init size: %f",size.height);
    //NSLog(@"safeArea.top: %f",self.view.safeAreaInsets.top);
    //NSLog(@"safeArea.bottom: %f",self.view.safeAreaInsets.bottom);
    size.height = size.height-self.view.safeAreaInsets.bottom;
    NSLog(@"final size: %f",size.height);
    MainScene *scene = [MainScene sceneWithSize:size];
    self.mainScene = scene;
    
    self.view = [[SKView alloc] initWithFrame:self.view.frame];
    SKView *view = (SKView *)self.view;
    [view presentScene:scene];
    view.showsNodeCount = YES;
    view.showsFPS = YES;
    
    PSButtonShapeNode *startButton = [PSButtonShapeNode buttonWithText:@"Start"];
    NSLog(@"%@",startButton);
    NSLog(@"%d",startButton.enabled);
    startButton.position = CGPointMake((scene.frame.size.width/2), (scene.frame.size.height/4));
    
    [startButton setEnabled:YES];
    NSLog(@"%d",startButton.enabled);
    [startButton setTouchDown:self selector:@selector(startButtonTapped)];
    
    self.startButtonNode = startButton;
    [scene addChild:startButton];
    
    [self.startButtonNode setTextColor:[SKColor blackColor]];
    
    PSButtonShapeNode *resetButton = [PSButtonShapeNode buttonWithText:@"Reset" color:[UIColor redColor] pressedColor:[UIColor orangeColor]];
    CGPoint point = startButton.position;
    point.x = startButton.position.x + resetButton.frame.size.width/2;
    point.y -= resetButton.frame.size.height;
    resetButton.position = point;
    
    [resetButton setEnabled:YES];
    [resetButton setTouchDown:self selector:@selector(resetButtonTapped)];
    
    self.resetButtonNode = resetButton;
    [scene addChild:resetButton];
    
    MCPiState *piState = [[MCPiState alloc] init];
    self.piState = piState;
    
    self.stopFlag = YES;
}

- (void)startButtonTapped{
    //NSLog(@"test");
    //Square A = 2r*2r = 4*r^2
    //Circle A = M_PI*r^2
    //4*r^2/M_PI*r^2 = M_PI/4
    //(M_PI/4)*4 = M_PI
    self.stopFlag = !self.stopFlag;
    
    NSString *text = @"Start";
    if([self.startButtonNode.label.text isEqualToString:@"Start"]){
        text = @"Stop";
    }
    
    self.startButtonNode.label.text = text;
    //TODO: [self.startButtonNode setText:@"test"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        while(!self.stopFlag){
            //NSLog(@"%g",self.mainScene.squareRect.size.height);
            NSLog(@"%g",self.mainScene.squareRect.size.width);
            
            int upperBound = (self.mainScene.squareRect.size.width/2);
            
            //between 1 and n
            //double x = arc4random_uniform(10)+1;
            //double y = arc4random_uniform(10)+1;
            
            //between 0 and (n-1)
            int x = arc4random_uniform(upperBound+1);
            int y = arc4random_uniform(upperBound+1);
            
            NSLog(@"x: %d",x);
            NSLog(@"y: %d",y);
            
            //srand48(time(0));
            //double r = drand48();
            
            //a^2+b^2=c^2
            
            int a = pow(x,2);
            int b = pow(y,2);
            int c = sqrt(a+b);
            
            //NSLog(@"a: %d",a);
            //NSLog(@"b: %d",b);
            NSLog(@"c: %d",c);
            
            UIColor *color = [UIColor redColor];
            
            if(c <= upperBound){
                self.piState.numerator++;
                color = [UIColor whiteColor];
            }
            
            [self.mainScene addPoint:x y:y color:color];
            
            self.piState.denominator++;
            double pi = (self.piState.numerator/self.piState.denominator)*4;
            
            NSString *piStr = [NSString stringWithFormat:@"%g",pi];
            self.mainScene.piLabelNode.text = piStr;
            //NSLog(@"%g",self.piState.denominator);
        }
    });
}

- (void)resetButtonTapped{
    NSLog(@"test");
}


@end
