//
//  LightenBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CILightenBlendMode"

#import "LightenBlendModeFilter.h"

@implementation LightenBlendModeFilter

+ (LightenBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    LightenBlendModeFilter *lbmf = [[LightenBlendModeFilter alloc] init];
    
    lbmf.filter = [CIFilter filterWithName:kFilterName];
    [lbmf.filter setDefaults];
    [lbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return lbmf;
}


@end
