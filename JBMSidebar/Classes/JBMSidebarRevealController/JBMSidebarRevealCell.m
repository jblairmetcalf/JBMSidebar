//
//  JBMSidebarRevealCell.m
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMSidebarRevealCell.h"
#import "JBMSidebarConstants.h"
#import "JBMTouchView.h"

#import "UIColor+Utility.h"

@interface JBMSidebarRevealCell ()

@property (nonatomic, strong) JBMTouchView *touchView;

@end

@implementation JBMSidebarRevealCell

#pragma mark - Override Methods

/*
 * Detect and send point to the touch view.
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    CGPoint point = CGPointMake(touchPoint.x - self.touchView.frame.origin.x, touchPoint.y - self.touchView.frame.origin.y);
    
    [self.touchView touchWithPoint:point];
}

#pragma mark - Public Methods

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    
    CGFloat alphaSelected = JBMSidebarRevealCell_alphaSelected;
    CGFloat alphaDeselected = JBMSidebarRevealCell_alphaDeselected;
    
    CGFloat alpha = isSelected ? alphaSelected : alphaDeselected;
    
    [UIView animateWithDuration:JBMSidebar_animationDuration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         self.imageView.alpha = alpha;
                         self.textLabel.alpha = alpha;
                     }
                     completion:nil];
}

#pragma mark - Override Methods

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect imageViewFrame = self.imageView.frame;
    CGRect textLabelFrame = self.textLabel.frame;
    
    imageViewFrame.origin.x = JBMSidebarRevealCell_imageView_frameOriginX;
    imageViewFrame.origin.y = JBMSidebarRevealCell_imageView_frameOriginY;
    
    textLabelFrame.origin.x = JBMSidebarRevealCell_textLabel_frameOriginX;
    textLabelFrame.origin.y = JBMSidebarRevealCell_textLabel_frameOriginY;
    
    self.imageView.frame = imageViewFrame;
    self.textLabel.frame = textLabelFrame;
}

#pragma mark - Instantiation Methods

/*
 * Complicated instantiation so you can reuse the touch view in the future.
 */
- (JBMTouchView *)touchView {
    if (!_touchView) {
        CGFloat frameOriginX = JBMSidebarRevealCell_touchView_frameOriginX;
        CGFloat frameOriginY = JBMSidebarRevealCell_touchView_frameOriginY;
        CGFloat frameSizeWidth = JBMSidebarRevealCell_touchView_frameSizeWdith;
        CGFloat frameSizeHeight = JBMSidebarRevealCell_touchView_frameSizeHeight;
        
        NSString *fillColorString = JBMSidebarRevealCell_touchView_fillColorString;
        
        CGFloat cornerRadius = JBMSidebarRevealCell_touchView_cornerRadius;
        
        CGRect frame = CGRectMake(frameOriginX, frameOriginY, frameSizeWidth, frameSizeHeight);
        
        _touchView = [[JBMTouchView alloc] initWithFrame:frame
                                            andFillColor:[UIColor colorWithHexString:fillColorString]
                                    andAnimationDuration:JBMSidebar_animationDuration];
        
        _touchView.layer.cornerRadius = cornerRadius;
        _touchView.layer.masksToBounds = YES;
        
        [self.contentView insertSubview:_touchView atIndex:0];
    }
    return _touchView;
}

@end
