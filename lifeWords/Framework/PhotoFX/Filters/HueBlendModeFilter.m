//
//  HueBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIHueBlendMode"

#import "HueBlendModeFilter.h"

@implementation HueBlendModeFilter

+ (HueBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    HueBlendModeFilter *hbmf = [[HueBlendModeFilter alloc] init];
    
    hbmf.filter = [CIFilter filterWithName:kFilterName];
    [hbmf.filter setDefaults];
    [hbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return hbmf;
}

@end
