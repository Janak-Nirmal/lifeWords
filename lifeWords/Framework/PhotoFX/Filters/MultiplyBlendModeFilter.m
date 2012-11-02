//
//  MultiplyBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIMultiplyBlendMode"

#import "MultiplyBlendModeFilter.h"

@implementation MultiplyBlendModeFilter

+ (MultiplyBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    MultiplyBlendModeFilter *mbmf = [[MultiplyBlendModeFilter alloc] init];
    
    mbmf.filter = [CIFilter filterWithName:kFilterName];
    [mbmf.filter setDefaults];
    [mbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return mbmf;
}

@end
