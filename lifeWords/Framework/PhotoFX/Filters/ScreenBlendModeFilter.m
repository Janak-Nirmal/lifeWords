//
//  ScreenBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIScreenBlendMode"

#import "ScreenBlendModeFilter.h"

@implementation ScreenBlendModeFilter

+ (ScreenBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    ScreenBlendModeFilter *sbmf = [[ScreenBlendModeFilter alloc] init];
    
    sbmf.filter = [CIFilter filterWithName:kFilterName];
    [sbmf.filter setDefaults];
    [sbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return sbmf;
}

@end
