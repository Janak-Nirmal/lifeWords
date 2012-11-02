//
//  HardLightBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIHardLightBlendMode"

#import "HardLightBlendModeFilter.h"

@implementation HardLightBlendModeFilter

+ (HardLightBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    HardLightBlendModeFilter *hlbmf = [[HardLightBlendModeFilter alloc] init];
    
    hlbmf.filter = [CIFilter filterWithName:kFilterName];
    [hlbmf.filter setDefaults];
    [hlbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return hlbmf;
}

@end
