//
//  JBMSidebarContentNavigationController.m
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMSidebarContentNavigationController.h"
#import "JBMSidebarContentController.h"
#import "JBMSidebarNavigationBar.h"
#import "UIColor+Utility.h"
#import "JBMSidebarConstants.h"

@interface JBMSidebarContentNavigationController ()

@property (nonatomic, strong) JBMSidebarContentController *viewController;
@property (nonatomic, strong) UIView *navigationBarBottomLine;
@property (nonatomic, strong) UIImage *indicatorImage;
@property (nonatomic, strong) UIImageView *indicatorImageView;

@end

@implementation JBMSidebarContentNavigationController

#pragma mark - Override Methods

- (instancetype)init {
    self = [super initWithNavigationBarClass:[JBMSidebarNavigationBar class] toolbarClass:nil];
    if (self) {
        /*
         * Initialize the contentIndex to -1 so it knows when it has been changed to a real value.
         */
        _contentIndex = -1;
        
        [self pushViewController:self.viewController animated:NO];
        
        NSString *barTintColorString = JBMSidebarContentNavigationController_navigationBar_barTintColorString;
        
        self.navigationBar.barTintColor = [UIColor colorWithHexString:barTintColorString];
        self.navigationBar.translucent = NO;
        
        [self.navigationBar addSubview:self.navigationBarBottomLine];
    }
    return self;
}

#pragma mark - Public Methods

- (void)setData:(NSDictionary *)data {
    self.viewController.data = data;
}

#pragma mark - Delegate Methods

- (void)setContentIndex:(NSInteger)contentIndex {
    if (_contentIndex != contentIndex) {
        _contentIndex = contentIndex;
        
        self.viewController.contentIndex = contentIndex;
        
        [self animateIndicatorImageViewFrame];
    }
}

#pragma mark - Private Methods

- (void)animateIndicatorImageViewFrame {
    CGRect frame = self.indicatorImageView.frame;
    CGFloat increment = JBMSidebarRevealCellHeight;
    CGFloat origin = JBMSidebarContentNavigationController_indicatorImageView_yOrigin;
    
    frame.origin.y = (self.contentIndex*increment)+origin;
    
    [UIView animateWithDuration:JBMSidebar_animationDuration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         self.indicatorImageView.frame = frame;
                     }
                     completion:nil];
}

#pragma mark - Instantiation Methods

- (UIView *)navigationBarBottomLine {
    if (!_navigationBarBottomLine) {
        CGFloat height = JBMSidebar_navigationBarBottomLine_height;
        NSString *backgroundColorString = JBMSidebarContentNavigationController_navigationBarBottomLine_backgroundColorString;
        
        CGRect frame = CGRectMake(0.0f, self.navigationBar.frame.size.height, self.navigationBar.frame.size.width, height);
        
        _navigationBarBottomLine = [[UIView alloc] initWithFrame:frame];
        _navigationBarBottomLine.backgroundColor = [UIColor colorWithHexString:backgroundColorString];
    }
    return _navigationBarBottomLine;
}

- (JBMSidebarContentController *)viewController {
    if (!_viewController) {
        _viewController = [JBMSidebarContentController new];
    }
    return _viewController;
}

- (UIImage *)indicatorImage {
    if (!_indicatorImage) {
        NSString *indicatorImageName = JBMSidebarContentNavigationController_indicatorImageName;
        
        _indicatorImage = [UIImage imageNamed:indicatorImageName];
    }
    return _indicatorImage;
}

- (UIImageView *)indicatorImageView {
    if (!_indicatorImageView) {
        CGRect frame = CGRectMake(-self.indicatorImage.size.width+0.5f, 0.0f, self.indicatorImage.size.width, self.indicatorImage.size.height);
        
        _indicatorImageView = [[UIImageView alloc] initWithImage:self.indicatorImage];
        _indicatorImageView.frame = frame;
        
        [self.view insertSubview:_indicatorImageView atIndex:0];
    }
    return _indicatorImageView;
}

@end
