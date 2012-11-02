//
//  LuminosityBlendModeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CILuminosityBlendMode"

#import "LuminosityBlendModeFilter.h"

@implementation LuminosityBlendModeFilter

+ (LuminosityBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    LuminosityBlendModeFilter *lbmf = [[LuminosityBlendModeFilter alloc] init];
    
    lbmf.filter = [CIFilter filterWithName:kFilterName];
    [lbmf.filter setDefaults];
    [lbmf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return lbmf;
}


@end
