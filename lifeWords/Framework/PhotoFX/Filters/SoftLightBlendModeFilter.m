//
//  SoftLightBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CISoftLightBlendMode"

#import "SoftLightBlendModeFilter.h"

@implementation SoftLightBlendModeFilter

+ (SoftLightBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    SoftLightBlendModeFilter *slbmf = [[SoftLightBlendModeFilter alloc] init];
    
    slbmf.filter = [CIFilter filterWithName:kFilterName];
    [slbmf.filter setDefaults];
    [slbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return slbmf;
}

@end
