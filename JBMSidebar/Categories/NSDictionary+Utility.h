//
//  NSDictionary+Utility.h
//  JBMCategories
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Utility)

+ (NSDictionary *)dictionaryWithContentsOfFile:(NSString *)filenname withOptions:(NSInteger)options;

@end
