//
//  ColorMapFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIColorMap"

#import "ColorMapFilter.h"

@implementation ColorMapFilter

+ (ColorMapFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    ColorMapFilter *cmf = [[ColorMapFilter alloc] init];
    
    cmf.filter = [CIFilter filterWithName:kFilterName];
    [cmf.filter setDefaults];
    [cmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return cmf;
}

@end
