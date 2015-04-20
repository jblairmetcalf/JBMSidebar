//
//  JBMSidebarRevealController.h
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JBMSidebarRevealControllerDelegate

- (void)didSelectRowAtIndex:(NSInteger)index;

@end

@interface JBMSidebarRevealController : UITableViewController

@property (nonatomic) NSDictionary *data;
@property (nonatomic, weak) id <JBMSidebarRevealControllerDelegate>delegate;
@property (nonatomic) NSInteger selectedIndex;

@end
