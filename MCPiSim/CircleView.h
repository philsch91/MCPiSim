//
//  CircleView.h
//  MCPiSim
//
//  Created by Philipp Schunker on 07.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleView : UIView

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat lineWidth;

@end

NS_ASSUME_NONNULL_END
