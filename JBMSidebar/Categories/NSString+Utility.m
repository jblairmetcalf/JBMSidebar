//
//  NSString+Utility.m
//  JBMCategories
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "NSString+Utility.h"

@implementation NSString (Utility)

+ (NSString *)UUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}

+ (NSString *)filePathWithFilename:(NSString *)filename {
    NSString *path = [filename stringByDeletingPathExtension];
    NSString *type = [filename pathExtension];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:path ofType:type];
    return filePath;
}

@end
