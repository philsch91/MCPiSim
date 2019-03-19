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
    PSMainScene *scene = [PSMainScene sceneWithSize:size];
    
    SKView *view = (SKView *)self.view;
    [view presentScene:scene];
    view.showsNodeCount = YES;
    view.showsFPS = YES;
    
    //PSButtonShapeNode *button = [PSButtonShapeNode buttonWithText:@"Test" color:[UIColor blueColor] pressedColor:[UIColor redColor]];
    PSButtonShapeNode *button = [PSButtonShapeNode buttonWithText:@"Test"];
    NSLog(@"%@",button);
    NSLog(@"%d",button.enabled);
    button.position = CGPointMake((scene.frame.size.width/2), (scene.frame.size.height/3));
    
    [scene addChild:button];
    
    [button setEnabled:YES];
    NSLog(@"%d",button.enabled);
    [button setTouchDown:self selector:@selector(test)];
}

-(void)test{
    NSLog(@"test");
}


@end
