//
//  JBMSidebarModel.h
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBMSidebarModel : NSObject

- (instancetype)initWithFilename:(NSString *)filename;

@property (nonatomic, strong) NSDictionary *data;

extern NSString *const JBMSidebarModelTitle;
extern NSString *const JBMSidebarModelSections;
extern NSString *const JBMSidebarModelContentTitle;
extern NSString *const JBMSidebarModelContentImage;
extern NSString *const JBMSidebarModelSidebarTitle;
extern NSString *const JBMSidebarModelSidebarImage;
extern NSString *const JBMSidebarModelNavigationItemOptions;
extern NSString *const JBMSidebarModelNavigationItemLayout;

@end
