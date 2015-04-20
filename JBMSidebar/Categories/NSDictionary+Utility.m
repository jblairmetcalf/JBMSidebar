//
//  NSDictionary+Utility.m
//  JBMCategories
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "NSDictionary+Utility.h"
#import "NSString+Utility.h"

@implementation NSDictionary (Utility)

+ (NSDictionary *)dictionaryWithContentsOfFile:(NSString *)filenname withOptions:(NSInteger)options {
    NSString *filePath = [NSString filePathWithFilename:filenname];
    NSError *dataError;
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath options:NSUTF8StringEncoding error:&dataError];
    if (!dataError) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:options error:&jsonError];
        if (!jsonError) {
            return json;
        }
    }
    return nil;
}

@end
