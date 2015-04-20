//
//  JBMCircleView.m
//  JBMReuseable
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMCircleView.h"

@interface JBMCircleView ()

@property (nonatomic, strong) UIColor *fillColor;

@end

@implementation JBMCircleView

#pragma mark - Public Methods

- (instancetype)initWithFrame:(CGRect)frame andFillColor:(UIColor *)fillColor {
    self = [super initWithFrame:frame];
    if (self) {
        _fillColor = fillColor;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

#pragma mark - Override Methods

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
    CGContextFillEllipseInRect(context, rect);
}

@end
