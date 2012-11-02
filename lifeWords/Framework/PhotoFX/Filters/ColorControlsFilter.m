//
//  ColorControlsFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIColorControls"

#import "ColorControlsFilter.h"

@implementation ColorControlsFilter

+ (ColorControlsFilter *)filterWithInputSaturation:(CGFloat)inputSaturation 
                                   inputBrightness:(CGFloat)inputBrightness
                                     inputContrast:(CGFloat)inputContrast {
    ColorControlsFilter *ccf = [[ColorControlsFilter alloc] init];
    
    ccf.filter = [CIFilter filterWithName:kFilterName];
    [ccf.filter setDefaults];
    [ccf.filter setValue:[NSNumber numberWithFloat:inputSaturation] forKey:@"inputSaturation"];
    [ccf.filter setValue:[NSNumber numberWithFloat:inputBrightness] forKey:@"inputBrightness"];
    [ccf.filter setValue:[NSNumber numberWithFloat:inputContrast] forKey:@"inputContrast"];
    
    return ccf;
}

@end
