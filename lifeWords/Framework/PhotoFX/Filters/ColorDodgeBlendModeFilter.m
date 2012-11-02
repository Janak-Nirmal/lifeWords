//
//  ColorDodgeBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIColorDodgeBlendMode"

#import "ColorDodgeBlendModeFilter.h"

@implementation ColorDodgeBlendModeFilter

+ (ColorDodgeBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    ColorDodgeBlendModeFilter *cdbmf = [[ColorDodgeBlendModeFilter alloc] init];
    
    cdbmf.filter = [CIFilter filterWithName:kFilterName];
    [cdbmf.filter setDefaults];
    [cdbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return cdbmf;
}

@end
