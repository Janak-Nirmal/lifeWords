//
//  ColorMonochromeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIColorMonochrome"

#import "ColorMonochromeFilter.h"

@implementation ColorMonochromeFilter

+ (ColorMonochromeFilter *)filterWithInputColor:(CIColor *)inputColor 
                                 inputIntensity:(CGFloat)inputIntensity {
    ColorMonochromeFilter *cmf = [[ColorMonochromeFilter alloc] init];
    
    cmf.filter = [CIFilter filterWithName:kFilterName];
    [cmf.filter setDefaults];
    [cmf.filter setValue:inputColor forKey:@"inputColor"];
    [cmf.filter setValue:[NSNumber numberWithFloat:inputIntensity] forKey:@"inputIntensity"];
    
    return cmf;  
}

@end
