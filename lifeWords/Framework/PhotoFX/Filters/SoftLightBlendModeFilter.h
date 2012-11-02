//
//  SoftLightBlendModeFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface SoftLightBlendModeFilter : Filter

+ (SoftLightBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage;

@end
