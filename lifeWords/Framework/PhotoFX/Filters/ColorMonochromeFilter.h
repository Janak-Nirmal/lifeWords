//
//  ColorMonochromeFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface ColorMonochromeFilter : Filter

+ (ColorMonochromeFilter *)filterWithInputColor:(CIColor *)inputColor inputIntensity:(CGFloat)inputIntensity;

@end
