//
//  ColorControlsFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface ColorControlsFilter : Filter

+ (ColorControlsFilter *)filterWithInputSaturation:(CGFloat)inputSaturation 
                                   inputBrightness:(CGFloat)inputBrightness
                                     inputContrast:(CGFloat)inputContrast;

@end
