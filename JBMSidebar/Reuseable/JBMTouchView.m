//
//  JBMTouchView.m
//  JBMReusable
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMTouchView.h"
#import "JBMCircleView.h"

@interface JBMTouchView ()

@property (nonatomic, strong) JBMCircleView *circleView;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic) CGFloat animationDuration;

@end

@implementation JBMTouchView

#pragma mark - Public Methods

- (instancetype)initWithFrame:(CGRect)frame
                 andFillColor:(UIColor *)fillColor
         andAnimationDuration:(CGFloat)animationDuration
{
    self = [super initWithFrame:frame];
    if (self) {
        _fillColor = fillColor;
        _animationDuration = animationDuration;
    }
    return self;
}

#pragma mark - Override Methods

/*
 * Measure the radius from the center of the frame to the corners,
 * so the touch circle can animate to fill the frame.
 */
- (void)touchWithPoint:(CGPoint)point {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    CGFloat diameter = [self distanceWithX:width andY:height];
    CGRect frame = CGRectMake((width-diameter)/2.0f, (height-diameter)/2.0f, diameter, diameter);
    
    self.circleView.frame = CGRectMake(point.x, point.y, 0.0f, 0.0f);
    self.circleView.alpha = 1.0f;
    
    [UIView animateWithDuration:self.animationDuration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ {
                         self.circleView.frame = frame;
                         self.circleView.alpha = 0.0f;
                     }
                     completion:nil];
}

#pragma mark - Private Method

- (CGFloat)distanceWithX:(CGFloat)x andY:(CGFloat)y {
    return sqrt(x*x+y*y);
}

#pragma mark - Instantiations

- (JBMCircleView *)circleView {
    if (!_circleView) {
        CGRect frame = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
        _circleView = [[JBMCircleView alloc] initWithFrame:frame andFillColor:self.fillColor];
        [self addSubview:_circleView];
    }
    return _circleView;
}

@end
