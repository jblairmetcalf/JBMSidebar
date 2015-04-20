//
//  JBMSidebarRevealNavigationController.h
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBMSidebarRevealController.h"

@interface JBMSidebarRevealNavigationController : UINavigationController

@property (nonatomic) NSDictionary *data;
@property (nonatomic, strong) JBMSidebarRevealController *tableViewController;
@property (nonatomic) NSInteger selectedIndex;

@end
