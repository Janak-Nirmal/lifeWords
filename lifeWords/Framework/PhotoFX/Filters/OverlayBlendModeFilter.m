//
//  OverlayBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIOverlayBlendMode"

#import "OverlayBlendModeFilter.h"

@implementation OverlayBlendModeFilter

+ (OverlayBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    OverlayBlendModeFilter *obmf = [[OverlayBlendModeFilter alloc] init];
    
    obmf.filter = [CIFilter filterWithName:kFilterName];
    [obmf.filter setDefaults];
    [obmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return obmf;
}

@end
