//
//  JBMSidebarModel.m
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMSidebarModel.h"

#import "NSDictionary+Utility.h"

@interface JBMSidebarModel ()

@property (nonatomic, strong) NSString *filename;

@end

@implementation JBMSidebarModel

NSString *const JBMSidebarModelTitle = @"title";
NSString *const JBMSidebarModelSections = @"sections";
NSString *const JBMSidebarModelContentTitle = @"contentTitle";
NSString *const JBMSidebarModelContentImage = @"contentImage";
NSString *const JBMSidebarModelSidebarTitle = @"sidebarTitle";
NSString *const JBMSidebarModelSidebarImage = @"sidebarImage";
NSString *const JBMSidebarModelNavigationItemOptions = @"navigationItemLayout";
NSString *const JBMSidebarModelNavigationItemLayout = @"navigationItemOptions";

#pragma mark - Override Methods

- (instancetype)initWithFilename:(NSString *)filename {
    self = [super init];
    if (self) {
        _filename = filename;
    }
    return self;
}

#pragma mark - Public Methods

- (NSDictionary *)data {
    if (!_data) {
        _data = [NSDictionary dictionaryWithContentsOfFile:self.filename withOptions:NSJSONReadingMutableContainers];
    }
    return _data;
}

@end
