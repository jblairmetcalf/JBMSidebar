//
//  JBMSidebarController.m
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMSidebarController.h"
#import "JBMSidebarContentNavigationController.h"
#import "JBMSidebarRevealNavigationController.h"
#import "JBMSidebarModel.h"
#import "JBMSidebarConstants.h"

@interface JBMSidebarController () <SWRevealViewControllerDelegate, JBMSidebarRevealControllerDelegate>

@property (nonatomic, strong) JBMSidebarContentNavigationController *contentNavigationController;
@property (nonatomic, strong) JBMSidebarRevealNavigationController *revealNavigationController;
@property (nonatomic, strong) JBMSidebarModel *model;

@end

@implementation JBMSidebarController

#pragma mark - Override Methods

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initDefaultProperties];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initDefaultProperties];
    }
    return self;
}

- (void)revealToggle:(id)object {
    [self revealToggleAnimated:YES];
}

#pragma mark - Private Methods

- (void)initDefaultProperties {
    self.rearViewController = self.revealNavigationController;
    self.frontViewController = self.contentNavigationController;
    
    self.contentNavigationController.data = self.model.data;
    self.revealNavigationController.data = self.model.data;
    
    /*
     * Set the defaults for the sidebar animations, widths, and positions.
     */
    self.delegate = self;
    self.rearViewRevealWidth = JBMSidebarViewController_rearViewRevealWidth;
    self.rearViewRevealDisplacement = JBMSidebarViewController_rearViewRevealDisplacement;
    self.rearViewRevealOverdraw = JBMSidebarViewController_rearViewRevealOverdraw;
    self.toggleAnimationDuration = JBMSidebarViewController_toggleAnimationDuration;
    
    self.contentNavigationController.contentIndex = self.revealNavigationController.selectedIndex;
    
    [self addNotifications];
}

#pragma mark - Notifications Methods

- (void)addNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
}

- (void)removeNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
 * Make sure you close the sidebar if the app is backgrounded.
 */
- (void)applicationDidEnterBackground:(NSNotification *)notifications {
    if (self.frontViewPosition == FrontViewPositionRight) {
        [self revealToggleAnimated:NO];
    }
}

#pragma mark - Delegate Methods

/*
 * Add a delay to the sidebar close animation so the user can see the selection for a moment.
 */
- (void)didSelectRowAtIndex:(NSInteger)index {
    [self performSelector:@selector(revealToggle:)
               withObject:nil
               afterDelay:JBMSidebarViewController_revealToggle_afterDelay];
    
    self.contentNavigationController.contentIndex = index;
}

#pragma mark - Instantiation Methods

- (JBMSidebarContentNavigationController *)contentNavigationController {
    if (!_contentNavigationController) {
        _contentNavigationController = [JBMSidebarContentNavigationController new];
    }
    return _contentNavigationController;
}

- (JBMSidebarRevealNavigationController *)revealNavigationController {
    if (!_revealNavigationController) {
        _revealNavigationController = [JBMSidebarRevealNavigationController new];
        _revealNavigationController.tableViewController.delegate = self;
    }
    return _revealNavigationController;
}

- (JBMSidebarModel *)model {
    if (!_model) {
        _model = [[JBMSidebarModel alloc] initWithFilename:JBMSidebarModelFilename];
    }
    return _model;
}

@end
