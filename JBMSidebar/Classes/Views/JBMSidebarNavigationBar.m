//
//  JBMSidebarNavigationBar.m
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMSidebarNavigationBar.h"
#import "JBMSidebarConstants.h"

@implementation JBMSidebarNavigationBar

#pragma mark - Override Methods

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat amendedSizeHeight = JBMSidebarNavigationBar_amendedSizeHeight;
    CGSize amendedSize = [super sizeThatFits:size];
    amendedSize.height += amendedSizeHeight;
    return amendedSize;
}

@end
