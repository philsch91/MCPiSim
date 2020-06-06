//
//  MainViewController.m
//  MCPiSim
//
//  Created by Philipp Schunker on 06.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(0, 0, 44, 44);
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    startButton.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height/4));
    
    [startButton setEnabled:YES];
    [startButton addTarget:self action:@selector(startButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"%@", startButton);
    NSLog(@"%d", startButton.enabled);
    
    self.startButton = startButton;
    [self.view addSubview:startButton];
    
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resetButton.frame = CGRectMake(0, 0, 44, 44);
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    CGPoint point = startButton.center;
    point.x = startButton.center.x;
    point.y += startButton.frame.size.height;
    resetButton.center = point;
    
    [resetButton setEnabled:YES];
    [resetButton addTarget:self action:@selector(resetButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"%@", resetButton);
    NSLog(@"%d", resetButton.enabled);
    
    self.resetButton = resetButton;
    [self.view addSubview:resetButton];
}

- (void)startButtonTapped{
    NSLog(@"startButtonTapped");
    //Square A = 2r*2r = 4*r^2
    //Circle A = M_PI*r^2
    //M_PI*r^2/4*r^2 = M_PI/4
    //(M_PI/4)*4 = M_PI
    self.stopFlag = !self.stopFlag;
    
    NSString *text = @"Start";
    
    if([self.startButton.titleLabel.text isEqualToString:@"Start"]){
        text = @"Stop";
    }
    
    [self.startButton setTitle:text forState:UIControlStateNormal];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        /*
        while(!self.stopFlag){
            //NSLog(@"%g",self.mainScene.squareRect.size.height);
            //NSLog(@"%g",self.mainScene.squareRect.size.width);
            
            //int upperBound = self.mainScene.squareRect.size.width/2;
            int upperBound = self.mainScene.squareShapeNode.frame.size.width;
            
            //between 1 and n
            //double x = arc4random_uniform(n)+1;
            //between 0 and (n-1)
            //double y = arc4random_uniform(n);
            
            int x = arc4random_uniform(upperBound+1) - self.mainScene.squareRect.size.width/2;
            int y = arc4random_uniform(upperBound+1) - self.mainScene.squareRect.size.height/2;
            
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
            
            CGColorRef color = [UIColor redColor].CGColor;
            
            if(c <= upperBound/2){
                self.piState.numerator++;
                color = [UIColor whiteColor].CGColor;
            }
            
            x += self.mainScene.squareRect.origin.x + self.mainScene.squareRect.size.width/2;
            y += self.mainScene.squareRect.origin.y + self.mainScene.squareRect.size.height/2;
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                CGRect bounds = self.view.bounds;
                UIGraphicsBeginImageContextWithOptions(bounds.size, NO, [UIScreen mainScreen].scale);
                CGContextRef contextRef = UIGraphicsGetCurrentContext();
                CGContextSetFillColorWithColor(contextRef, color);
                CGContextFillRect(contextRef, CGRectMake(x, y, 1, 1));
                //CGContextAddEllipseInRect(Context,(CGRectMake (x, y, 1, 1));
                //CGContextDrawPath(Context, kCGPathFill);
                //CGContextStrokePath(Context);
                //UIImage *screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
            });
            
            self.piState.denominator++;
            double pi = (self.piState.numerator/self.piState.denominator)*4;
            
            NSString *piStr = [NSString stringWithFormat:@"%g",pi];
            self.piLabel.text = piStr;
            //NSLog(@"%g",self.piState.denominator);
        } */
    });
}

- (void)resetButtonTapped{
    NSLog(@"resetButtonTapped");
    //[self.mainScene.squareShapeNode removeAllChildren];
    self.piState = [[MCState alloc] init];
    //self.mainScene.piLabelNode.text = @"0.0";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
