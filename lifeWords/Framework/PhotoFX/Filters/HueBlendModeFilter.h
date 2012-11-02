//
//  HueBlendModeFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface HueBlendModeFilter : Filter

+ (HueBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage;

@end
