//
//  ExclusionBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIExclusionBlendMode"

#import "ExclusionBlendModeFilter.h"

@implementation ExclusionBlendModeFilter

+ (ExclusionBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    ExclusionBlendModeFilter *ebmf = [[ExclusionBlendModeFilter alloc] init];
    
    ebmf.filter = [CIFilter filterWithName:kFilterName];
    [ebmf.filter setDefaults];
    [ebmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return ebmf;
}


@end
