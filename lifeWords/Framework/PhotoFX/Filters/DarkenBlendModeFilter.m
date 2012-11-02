//
//  DarkenBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIDarkenBlendMode"

#import "DarkenBlendModeFilter.h"

@implementation DarkenBlendModeFilter

+ (DarkenBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    DarkenBlendModeFilter *dbmf = [[DarkenBlendModeFilter alloc] init];
    
    dbmf.filter = [CIFilter filterWithName:kFilterName];
    [dbmf.filter setDefaults];
    [dbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return dbmf;
}


@end
