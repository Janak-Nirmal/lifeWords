//
//  LuminosityBlendModeFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface LuminosityBlendModeFilter : Filter

+ (LuminosityBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage;

@end
