//
//  ColorBlendModeFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface ColorBlendModeFilter : Filter

+ (ColorBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage;

@end
