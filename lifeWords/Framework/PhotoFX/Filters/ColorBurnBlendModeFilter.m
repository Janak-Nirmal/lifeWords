//
//  ColorBurnBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIColorBurnBlendMode"

#import "ColorBurnBlendModeFilter.h"

@implementation ColorBurnBlendModeFilter

+ (ColorBurnBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    ColorBurnBlendModeFilter *cbbmf = [[ColorBurnBlendModeFilter alloc] init];
    
    cbbmf.filter = [CIFilter filterWithName:kFilterName];
    [cbbmf.filter setDefaults];
    [cbbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return cbbmf;
}

@end
