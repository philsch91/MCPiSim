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
    
    self.view.backgroundColor = [UIColor whiteColor];
    double offset = 50;
    
    CGRect square = self.view.frame;
    square.size.height = square.size.width;
    square.origin.y += offset;
    
    RectangleView *squareView = [[RectangleView alloc] initWithFrame:square];
    squareView.lineWidth = 5.0;
    squareView.strokeColor = [UIColor blueColor];
    squareView.backgroundColor = [UIColor clearColor];
    self.squareView = squareView;
    
    [self.view addSubview:self.squareView];
    
    CircleView *circleView = [[CircleView alloc] initWithFrame:square];
    circleView.lineWidth = 5.0;
    circleView.strokeColor = [UIColor blueColor];
    circleView.backgroundColor = [UIColor clearColor];
    self.circleView = circleView;
    
    [self.view addSubview:self.circleView];
    
    //piLabel
    
    UILabel *piLabel = [[UILabel alloc] init];
    piLabel.frame = CGRectMake(0, 0, 64, 44);
    piLabel.text = @"0.0";
    piLabel.textAlignment = NSTextAlignmentCenter;
    piLabel.center = CGPointMake((self.view.frame.size.width/2), self.view.frame.size.width + piLabel.frame.size.height + offset);
    
    self.piLabel = piLabel;
    [self.view addSubview:self.piLabel];
    
    //startButton
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(0, 0, 44, 44);
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    //startButton.center = CGPointMake((self.view.frame.size.width/2), self.view.frame.size.width + startButton.frame.size.height + offset);
    CGPoint point = piLabel.center;
    point.x = piLabel.center.x;
    point.y += startButton.frame.size.height;
    startButton.center = point;
    
    [startButton setEnabled:YES];
    [startButton addTarget:self action:@selector(startButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"%@", startButton);
    NSLog(@"%d", startButton.enabled);
    
    self.startButton = startButton;
    [self.view addSubview:startButton];
    
    //resetButton
    
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resetButton.frame = CGRectMake(0, 0, 44, 44);
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    CGPoint resetButtonCenterPoint = startButton.center;
    resetButtonCenterPoint.x = startButton.center.x;
    resetButtonCenterPoint.y += startButton.frame.size.height;
    resetButton.center = resetButtonCenterPoint;
    
    [resetButton setEnabled:YES];
    [resetButton addTarget:self action:@selector(resetButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"%@", resetButton);
    NSLog(@"%d", resetButton.enabled);
    
    self.resetButton = resetButton;
    [self.view addSubview:resetButton];
    
    MCState *piState = [[MCState alloc] init];
    self.piState = piState;
    
    self.stopFlag = YES;
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
    
    CGRect square = self.squareView.frame;
    //CGRect bounds = self.squareView.bounds;
    
    NSLog(@"square.size.width %f", square.size.width);
    NSLog(@"square.size.height %f", square.size.height);
    
    int upperBound = square.size.width;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        while(!self.stopFlag){
            //between 1 and n
            //double x = arc4random_uniform(n)+1;
            //between 0 and (n-1)
            //double y = arc4random_uniform(n);
            
            int x = arc4random_uniform(upperBound+1) - square.size.width/2;
            int y = arc4random_uniform(upperBound+1) - square.size.height/2;
            
            //NSLog(@"x: %d",x);
            //NSLog(@"y: %d",y);
            
            //srand48(time(0));
            //double r = drand48();
            
            //a^2+b^2=c^2
            
            int a = pow(x,2);
            int b = pow(y,2);
            int c = sqrt(a+b);
            
            //NSLog(@"a: %d",a);
            //NSLog(@"b: %d",b);
            NSLog(@"c: %d",c);
            
            CGColorRef colorRef = [UIColor redColor].CGColor;
            
            if(c <= upperBound/2){
                self.piState.numerator++;
                colorRef = [UIColor blackColor].CGColor;
            }
            
            x += square.size.width/2;
            y += square.size.height/2;
            
            NSLog(@"x: %d",x);
            NSLog(@"y: %d",y);
            
            ///not working
            /*
            UIGraphicsBeginImageContextWithOptions(bounds.size, NO, [UIScreen mainScreen].scale);
            CGContextRef contextRef = UIGraphicsGetCurrentContext();
            //CGContextSetFillColorWithColor(contextRef, colorRef);
            //CGContextFillRect(contextRef, CGRectMake(x, y, 3, 3));
            
            CGContextSetStrokeColorWithColor(contextRef, colorRef);
            CGContextAddEllipseInRect(contextRef,CGRectMake(x, y, 3, 3));
            CGContextDrawPath(contextRef, kCGPathFill);
            CGContextStrokePath(contextRef);
            UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            CALayer *layer = [[CALayer alloc] init];
            layer.frame = square;
            [layer setContents:viewImage];
            [self.squareView.layer addSublayer:layer];
            
            //[self.squareView.layer setContents:viewImage];
            */
            
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, y, 3.0, 3.0)];
            CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
            shapeLayer.path = path.CGPath;
            shapeLayer.fillColor = colorRef;
            shapeLayer.strokeColor = colorRef;
            //[self.squareView.layer addSublayer:shapeLayer];   //needs a call of [self.squareView.layer setNeedsDisplay]
            
            self.piState.denominator++;
            //NSLog(@"%g",self.piState.denominator);
            double pi = (self.piState.numerator/self.piState.denominator)*4;
            
            NSString *piStr = [NSString stringWithFormat:@"%g",pi];
            
            //dispatch_async seems to coalesce updates and therefore be faster
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.squareView.layer addSublayer:shapeLayer];
                //[self.squareView.layer setNeedsDisplay];
                self.piLabel.text = piStr;
            });
        }
    });
}

- (void)resetButtonTapped{
    NSLog(@"resetButtonTapped");
    NSLog(@"squareView.layer.sublayers.count: %ld", self.squareView.layer.sublayers.count);
    
    /*
    NSArray<CALayer *> *squareViewSublayers = [self.squareView.layer.sublayers copy];
    
    for (CALayer *layer in squareViewSublayers) {
        [layer removeFromSuperlayer];
    }
    */
    
    while ([self.squareView.layer.sublayers lastObject] != nil) {
        [[self.squareView.layer.sublayers lastObject] removeFromSuperlayer];
    }
    
    self.piState = [[MCState alloc] init];
    self.piLabel.text = @"0.0";
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
