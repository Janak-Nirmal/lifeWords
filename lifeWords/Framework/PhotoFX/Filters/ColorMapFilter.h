//
//  ColorMapFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface ColorMapFilter : Filter

+ (ColorMapFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage;

@end
