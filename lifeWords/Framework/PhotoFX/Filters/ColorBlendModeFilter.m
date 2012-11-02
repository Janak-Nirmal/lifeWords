//
//  ColorBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIColorBlendMode"

#import "ColorBlendModeFilter.h"

@implementation ColorBlendModeFilter

+ (ColorBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    ColorBlendModeFilter *cbmf = [[ColorBlendModeFilter alloc] init];
    
    cbmf.filter = [CIFilter filterWithName:kFilterName];
    [cbmf.filter setDefaults];
    [cbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return cbmf;
}

@end
