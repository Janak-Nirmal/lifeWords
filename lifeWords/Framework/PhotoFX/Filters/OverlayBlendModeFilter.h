//
//  OverlayBlendModeFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface OverlayBlendModeFilter : Filter

+ (OverlayBlendModeFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage;

@end
