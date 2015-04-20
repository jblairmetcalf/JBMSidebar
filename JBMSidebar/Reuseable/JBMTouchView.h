//
//  JBMTouchView.h
//  JBMReusable
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBMTouchView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                 andFillColor:(UIColor *)fillColor
         andAnimationDuration:(CGFloat)animationDuration;

- (void)touchWithPoint:(CGPoint)point;

@end
