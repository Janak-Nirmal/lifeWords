//
//  SaturationBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CISaturationBlendMode"

#import "SaturationBlendModeFilter.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation SaturationBlendModeFilter

+ (SaturationBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    SaturationBlendModeFilter *sbmf = [[SaturationBlendModeFilter alloc] init];
    
    sbmf.filter = [CIFilter filterWithName:kFilterName];
    [sbmf.filter setDefaults];
    [sbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return sbmf;
}

@end
