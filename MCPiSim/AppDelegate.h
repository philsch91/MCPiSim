//
//  AppDelegate.h
//  MCPiSim
//
//  Created by Philipp Schunker on 10.02.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MainViewController.h"
#import "SecondViewController.h"
#import "SceneViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIPageViewControllerDataSource>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;

@end

