//
//  NSString+Utility.h
//  JBMCategories
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utility)

+ (NSString *)UUID;
+ (NSString *)filePathWithFilename:(NSString *)filename;

@end
