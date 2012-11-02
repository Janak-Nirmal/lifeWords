//
//  DifferenceBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIDifferenceBlendMode"

#import "DifferenceBlendModeFilter.h"

@implementation DifferenceBlendModeFilter

+ (DifferenceBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    DifferenceBlendModeFilter *dbmf = [[DifferenceBlendModeFilter alloc] init];
    
    dbmf.filter = [CIFilter filterWithName:kFilterName];
    [dbmf.filter setDefaults];
    [dbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return dbmf;
}

@end
