//
//  JBMSidebarRevealNavigationController.m
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMSidebarRevealNavigationController.h"
#import "JBMSidebarNavigationBar.h"
#import "UIColor+Utility.h"
#import "JBMSidebarConstants.h"

@interface JBMSidebarRevealNavigationController ()

@property (nonatomic, strong) UIView *navigationBarBottomLine;

@end

@implementation JBMSidebarRevealNavigationController

#pragma mark - Override Methods

- (instancetype)init {
    self = [super initWithNavigationBarClass:[JBMSidebarNavigationBar class] toolbarClass:nil];
    
    if (self) {
        [self pushViewController:self.tableViewController animated:NO];
        
        NSString *barTintColorString = JBMSidebarRevealNavigationController_navigationBar_barTintColorString;
        
        self.navigationBar.barTintColor = [UIColor colorWithHexString:barTintColorString];
        self.navigationBar.translucent = NO;
        
        [self.navigationBar addSubview:self.navigationBarBottomLine];
    }
    return self;
}

#pragma mark - Public Methods

- (void)setData:(NSDictionary *)data {
    self.tableViewController.data = data;
}

- (NSInteger)selectedIndex {
    return self.tableViewController.selectedIndex;
}

#pragma mark - Instantiation Methods

- (UIView *)navigationBarBottomLine {
    if (!_navigationBarBottomLine) {
        CGFloat frameHeight = JBMSidebar_navigationBarBottomLine_height;
        NSString *backgroundColorString = JBMSidebarRevealNavigationController_navigationBarBottomLine_backgroundColorString;
        
        CGRect frame = CGRectMake(0.0f, self.navigationBar.frame.size.height, self.navigationBar.frame.size.width, frameHeight);
        
        _navigationBarBottomLine = [[UIView alloc] initWithFrame:frame];
        _navigationBarBottomLine.backgroundColor = [UIColor colorWithHexString:backgroundColorString];
    }
    return _navigationBarBottomLine;
}

- (JBMSidebarRevealController *)tableViewController {
    if (!_tableViewController) {
        _tableViewController = [JBMSidebarRevealController new];
    }
    return _tableViewController;
}

@end
